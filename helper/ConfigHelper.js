const fs=require('fs');
function ConfigHelper(){
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
}
ConfigHelper.prototype.isCompanyDir=function(name){
	try{
		return fs.lstatSync(this.getBasePath()+'/'+name).isDirectory();
	}
	catch(e){
		return false;
	}
	return false;
}
ConfigHelper.prototype.mkCompanyDir=function(path){
	var company=this.getBasePath()+'/'+path;
	if(!this.isCompanyDir(path))
		fs.mkdirSync(company);
	return true;
}
ConfigHelper.prototype.save=function(configItem,data){
	var file=this.getBasePath()+'/'+configItem+'.xml';
	return fs.writeFileSync(file,data);
}
ConfigHelper.prototype.load=function(domain,configItem){
	var path=this.getBasePath()+'/'+domain+'/'+configItem+'.xml';
	if(!fs.existsSync(path))
		throw new Error('Configuration doesnot exist.');
	const GetConfigHelper=require('./GetConfigHelper.js');
	var gch=new GetConfigHelper(path);
	return gch;	
}
module.exports=exports=ConfigHelper;