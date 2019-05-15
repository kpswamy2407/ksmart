const Query=require('./Query.js');
const FnxtModelError=require('./../../errors/FnxtModelError');

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
		if(__db==undefined) throw new FnxtModelError(500,'ERR-XXX-xxxx','Db connection has NOT been set.');
		return __db;
	}
	this.logger=function(loggr){
		if(loggr==undefined){
			return this.getCh().logger();
		}else{
			this.getCh().logger(loggr);
			return this;
		}
	}
}
xDistDeviceRegister.getKey=function(collc,key){
	if(collc[key]==undefined)
		throw new FnxtModelError(500,'ERR-XXX-xxxx','Key %s does NOT exist in the collections.'.replace('%s',key));
	return Object.assign({},collc[key]);
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
xDistDeviceRegister.prototype.setDeviceUniqueKey=function(key){
	var __sql=this.loadDms().getKey('distdeviceregistrationupdatesql');
	var __params=this.queryParams();
	__params['deviceuniquekey']=key;
	if(__params.hasOwnProperty('unregister'))
		delete __params["unregister"];
	var query=new Query(__sql,__params);
	return this.__query(query,'UPDATE').then(_=>{
		return 0;
	});
}
xDistDeviceRegister.prototype.isValidSalesman=function(salesman){
	if(salesman==undefined || salesman.isactive==undefined)
		return false;
	if(salesman.isactive==1)
		return true;
	return false;
}
xDistDeviceRegister.prototype.register=function(){
	var __sql=this.loadDms().getKey('distdeviceregistrationsql');
	var __params=this.queryParams();
	var self=this;
	this.setDb(this.getCh().getDb());
	var __unregister=false;
	if(__params.hasOwnProperty('unregister')&&__params['unregister']=='true'){
		__unregister=true;
		delete __params["unregister"];
	}
	var query=new Query(__sql,__params);
	return this.__query(query).spread(function(salesman){
		var isValid=self.isValidSalesman(salesman);
		if(__unregister && !isValid){
			return self.setDeviceUniqueKey('');
		}else if(isValid){
			return self.setDeviceUniqueKey(__params['deviceuniquekey']);
		}else{
			throw new FnxtModelError(403,'ERR-DMS-0021','User already registered with other desktop OR mobile OR Version Mismatch.');
		}
	}).finally(function(){
		self.getDb().close();
		self.setDb(null);
	});
}
module.exports=exports=xDistDeviceRegister;