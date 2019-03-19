const fs=require('fs');
function ConfigHelper(company){
	var __path;
	var __migrationPath;
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
	this.setMigrationBasePath=function(p){
		__migrationPath=p;
	}
	this.getMigrationBasePath=function(){
		if(__migrationPath==undefined)
			throw new Error('Migration path hasnot been set.');
		return __migrationPath;
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
ConfigHelper.prototype.isXSLTPathExits=function(path){
	try{
		return fs.lstatSync(path).isDirectory();
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
ConfigHelper.prototype.getXSLTFile=function(source,dest,entity){
	return new Promise((resolve,reject)=>{
		var destPath=this.getBasePath()+"/"+this.companyName()+"/"+this.getMigrationBasePath()+"/"+source+"_to_"+dest;
		console.log(destPath);
		if(!this.isXSLTPathExits(destPath)){
			fs.mkdir(destPath, { recursive: true }, (err) => {
  				if (err) throw new Error("Error while creating folder");
  					resolve(destPath+"/"+entity+".xsl")
			});	
		}
		else{
			resolve(destPath+"/"+entity+".xsl")
		}
	})
}
ConfigHelper.prototype.saveXSLTFile=function(source,dest,entity,data){
	return this.getXSLTFile(source,dest,entity).then(file=>{
		if(file){
			return fs.writeFile(file,data,(err,res)=>{
			if(err){
				throw new Error("Internal Error");
				}
			});
		}
		else{
			throw new Error("Internal Error");
		}
	})
}
ConfigHelper.prototype.configXSLPath=function(source,dest,entity){
	return this.getXSLTFile(source,dest,entity).then(path=>{
		if(!fs.existsSync(path))
			throw new Error('XSL file doesnot exist.');
		return path;
	});
	
}
module.exports=exports=ConfigHelper;