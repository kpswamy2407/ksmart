const fs=require('fs');
function ConfigHelper(company){
	var __path;
	this.setBasePath=function(p){
		try{
			if(!fs.lstatSync(p).isDirectory()){
				throw new Error('The provided path is NOT a valid directory.');
			}
		}
		catch(e){
			throw new Error('The provided path is NOT a valid directory.');
		}
		__path=p;
	}
	this.getBasePath=function(){
		if(__path==undefined)
			throw new Error('Base path hasnot been set.');
		return __path;
	}
	this.company=company;
}
ConfigHelper.prototype.companyName=function(){
	if(this.company == undefined) throw new Error('Company name has NOT been set.');
	return this.company;
}
ConfigHelper.prototype.companyPath=function(){
	return this.getBasePath()+'/'+this.companyName();
}
ConfigHelper.prototype.companyExists=function(){
	try{
		return fs.lstatSync(this.companyPath()).isDirectory();
	}
	catch(e){
		return false;
	}
	return false;
}
ConfigHelper.prototype.createCompany=function(){
	if(!this.companyExists()) fs.mkdirSync(this.companyPath());
	return true;
}
ConfigHelper.prototype.save=function(configItem,data){
	var file=this.companyPath()+'/'+configItem+'.xml';
	return fs.writeFileSync(file,data);
}
ConfigHelper.prototype.__getPath=function(configItem){
	var path=this.companyPath()+'/'+configItem+'.xml';
	if(!fs.existsSync(path))
		throw new Error('Configuration doesnot exist.');
	return path;
}
ConfigHelper.prototype.load=function(configItem){
	const GetConfigHelper=require('./GetConfigHelper.js');
	return new GetConfigHelper(this.__getPath(configItem));
}
ConfigHelper.prototype.configPath=function(configItem){
	return this.__getPath(configItem);
}
ConfigHelper.prototype.loadDms=function(configItem){
	return this.load('dms');
}
ConfigHelper.prototype.getDb=function(){
	const Sequelize=require('sequelize');
	var dms=this.loadDms();
	return new Sequelize(dms.getKey('centralmastermysqldatabase'),null,null,{
		dialect:'mysql',
		replication:{
			write:{
				host:dms.getKey('centralmastermysqlhost'),
				port:dms.getKey('centralmastermysqlport'),
				username:dms.getKey('centralmastermysqluser'),
				password:dms.getKey('centralmastermysqlpassword'),
			},
			read:[
				{
					host:dms.getKey('centralslavemysqlhost'),
					port:dms.getKey('centralslavemysqlport'),
					username:dms.getKey('centralmastermysqluser'),
					password:dms.getKey('centralmastermysqlpassword'),
				}
			]
		}
	});
}
module.exports=exports=ConfigHelper;