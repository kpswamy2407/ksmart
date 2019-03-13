const Query=require('./Query.js');
function xDistDeviceRegister(company,data){
	const ConfigHelper=require('./../ConfigHelper.js');
	var ch=new ConfigHelper(company);
	this.data=data;
	this.getCh=function(){
		return ch;
	}
	var __db;
	this.setDb=function(db){
		__db=db;	
	}
	this.getDb=function(){
		if(__db==undefined) throw new Error('Db connection has NOT been set.');
		return __db;
	}
}
xDistDeviceRegister.getKey=function(collc,key){
	if(collc[key]==undefined)
		throw new Error('Key %s does NOT exist in the collection.'.replace('%s',key));
	return collc[key];
}
xDistDeviceRegister.prototype.setBasePath=function(p){
	this.getCh().setBasePath(p);
	return this;
}
xDistDeviceRegister.prototype.loadDms=function(){
	return this.getCh().loadDms();
}
xDistDeviceRegister.prototype.queryParams=function(){
	var __params=xDistDeviceRegister.getKey(this.data,'collections');
	return xDistDeviceRegister.getKey(__params,'xdistdeviceregistration');
}
xDistDeviceRegister.prototype.__query=function(query,type){
	if(type==undefined || type=='SELECT') type=this.getDb().QueryTypes.SELECT;
	else if(type=='UPDATE') type=this.getDb().QueryTypes.UPDATE;
	return this.getDb().query(query.replace(),{
		replacements:query.params(),
		type:type
	});
}
xDistDeviceRegister.prototype.__update=function(){
	var __sql=this.loadDms().getKey('distdeviceregistrationupdatesql');
	var __params=this.queryParams();
	var query=new Query(__sql,__params);
	return this.__query(query,'UPDATE');
}
xDistDeviceRegister.prototype.__updateIfActive=function(result){
	if(result != undefined && result.isactive==1)
		return this.__update();
}
xDistDeviceRegister.prototype.register=function(){
	var __sql=this.loadDms().getKey('distdeviceregistrationsql');
	var __params=this.queryParams();
	var query=new Query(__sql,__params);
	var __cb=this.__updateIfActive.bind(this);
	this.setDb(this.getCh().getDb());
	return this.__query(query).spread(__cb).finally(()=>{
		this.getDb().close();
		this.setDb(null);
	});
}
module.exports=exports=xDistDeviceRegister;