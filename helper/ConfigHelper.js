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
ConfigHelper.prototype.companyExists=function(){
	try{
		return fs.lstatSync(this.getBasePath()+'/'+this.company).isDirectory();
	}
	catch(e){
		return false;
	}
	return false;
}
ConfigHelper.prototype.createCompany=function(){
	var company=this.getBasePath()+'/'+this.company;
	if(!this.companyExists())
		fs.mkdirSync(company);
	return true;
}
ConfigHelper.prototype.save=function(configItem,data){
	var file=this.getBasePath()+'/'+configItem+'.xml';
	return fs.writeFileSync(file,data);
}
ConfigHelper.prototype.__getPath=function(domain,configItem){
	return this.getBasePath()+'/'+domain+'/'+configItem+'.xml';
	if(!fs.existsSync(path))
		throw new Error('Configuration doesnot exist.');
	return path;
}
ConfigHelper.prototype.load=function(domain,configItem){
	const GetConfigHelper=require('./GetConfigHelper.js');
	return new GetConfigHelper(this.__getPath(domain,configItem));
}
ConfigHelper.prototype.configPath=function(domain,configItem){
	return this.__getPath(domain,configItem);
}
module.exports=exports=ConfigHelper;