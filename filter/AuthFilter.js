const HttpError=require('./../error/HttpError.js');
const RedisHelper=require('./../helper/redisHelper.js');
function AuthFilter(ip,token,user,key){
	this.ip=ip;
	this.authToken=token;
	this.authUser=user;
	this.apiKey=key;
	var redh=new RedisHelper();
	this.getRedis=function(){
		return redh;
	}
}
AuthFilter.prototype.validateAttr=function(attr){
	if(this[attr]==undefined) throw new Error('HTTP request is invalid with missing fields.');
}
AuthFilter.prototype.validateAuth=function(){
	return this.getRedis().getValue(this.authToken).then(val=>{
		if(val==null || val != this.authToken){
			throw new Error('Auth token is invalid.');
		}
		return true;
	});
}
AuthFilter.prototype.validateApi=function(){
	return this.getRedis().getValue(this.authToken+'_apikey').then(val=>{
		if(val==null || val != this.apiKey){
			throw new Error('API key is invalid.');
		}
		return true;
	});
}
AuthFilter.prototype.validate=async function(){
	var attr=['ip','authToken','authUser','apiKey'];
	var __cb=this.validateAttr.bind(this);
	attr.forEach(__cb);
	await this.validateAuth();
	await this.validateApi();
	return true;
}
AuthFilter.GetQuery=function(query,key){
	if(query[key]==undefined) return undefined;
	return query[key];
}
AuthFilter.IsQueryValid=function(query,key){
	var val=this.GetQuery(query,key);
	if(val==undefined) return false;
	if(val.length==0) return false;
	return true;
}
module.exports=exports=function(req,res,next){
	var path=req.path.split('/');
	path=(path.length >= 2)? path[1] : undefined;
	switch(path){
		case 'esb':
			if(!AuthFilter.IsQueryValid(req.query,'authusername')){
				next(new HttpError(401,'ERR-xx-xxxx','Auth username should not be empty.'));
				return;
			}
			if(!AuthFilter.IsQueryValid(req.query,'auth_token')){
				next(new HttpError(401,'ERR-xx-xxxx','Auth token should not be empty.'));
				return;
			}
			if(!AuthFilter.IsQueryValid(req.query,'api_key')){
				next(new HttpError(401,'ERR-xx-xxxx','Api key should not be empty.'));
				return;
			}
			var ip=AuthFilter.GetQuery(req,'ip');
			var auth=AuthFilter.GetQuery(req.query,'auth_token');
			var user=AuthFilter.GetQuery(req.query,'authusername');
			var api=AuthFilter.GetQuery(req.query,'api_key');
			var authf=new AuthFilter(ip,auth,user,api);
			try{
				authf.validate().then((val)=>{
					next();
				}).catch(e=>{
					next(new HttpError(401,'ERR-xx-xxxx',e.message));
				});
			}catch(e){
				next(new HttpError(401,'ERR-xx-xxxx','Authentication failure.'));
			}
		break;
		case 'auth':
		case 'migration':
			next();
		break;
		default:
			next(new HttpError(404,'ERR-xx-xxxx','Invalid URL.'));
		break;
	}
};