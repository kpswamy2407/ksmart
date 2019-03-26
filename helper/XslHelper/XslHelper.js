const fs=require('fs');
const XslError=require('./XslError');
function XslHelper(){
	var __basePath,
		__companyName,
		__migrFolder,
		__sourceDest;
	this.setBasePath=function(path){
		if(!XslHelper.isDir(path))
			throw new XslError(500,'ERR-XXX-xxxx','Base path is NOT a valid directory.');
		__basePath=path;
		return this;
	}
	this.basePath=function(path){
		if(arguments.length==0){
			if(__basePath==undefined)
				throw new XslError(500,'ERR-XXX-xxxx','Base path has NOT been set.');
			return __basePath;
		}
		else{
			return this.setBasePath(path);
		};
	}
	this.companyName=function(company){
		if(arguments.length==0){
			if(__companyName==undefined) 
				throw new XslError(500,'ERR-XXX-xxxx','Company name has NOT been set.');
			return __companyName;
		}else{
			if(company==undefined || company=='')
				throw new XslError(500,'ERR-XXX-xxxx','Invalid argument for company name.');
			__companyName=company;
			return this;
		}
	};
	this.migrationFolder=function(folder){
		if(arguments.length==0){
			if(__migrFolder==undefined) throw new XslError(500,'ERR-XXX-xxxx','Migration folder name has NOT been set.');
			else return __migrFolder;
		}else{
			if(folder==undefined || folder=='')
				 throw new XslError(500,'ERR-XXX-xxxx','Invalid argument for migration folder name.');
			__migrFolder=folder;
			return this;
		}
	};
	this.sourceDestName=function(src,dest){
		if(arguments.length==0){
			if(__sourceDest==undefined) throw new XslError(500,'ERR-XXX-xxxx','Source & Destination has NOT been set.');
			return __sourceDest;
		}
		else{
			if(src=='' || dest=='') throw new XslError(500,'ERR-XXX-xxxx','Invalid arguments.');
			if(src==undefined || dest==undefined) throw new XslError(500,'ERR-XXX-xxxx','Invalid arguments.');
			__sourceDest='%s_to_%d'.replace('%s',src).replace('%d',dest);
			return this;
		}
	};
}
XslHelper.EXTENSION_XSL='xsl';
XslHelper.isDir=function(path){
	try{
		if(fs.lstatSync(path).isDirectory()) return true;
		else return false;
	}
	catch(e){
		return false;
	}
}
XslHelper.prototype.service;
XslHelper.prototype.serviceName=function(){
	if(this.service==undefined || this.service=='')
		throw new XslError(500,'ERR-XXX-xxxx','Service has NOT been set.');
	return this.service;
};
XslHelper.prototype.companyPath=function(){
	return '%b/%c'.replace('%b',this.basePath()).replace('%c',this.companyName());
}
XslHelper.prototype.migrPath=function(){
	return '%bc/%m'.replace('%bc',this.companyPath())
					.replace('%m',this.migrationFolder());
}
XslHelper.prototype.sourceDestPath=function(){
	return '%mp/%sd'.replace('%mp',this.migrPath())
					.replace('%sd',this.sourceDestName());
}
XslHelper.prototype.servicePath=function(){
	return '%sd/%s.%e'.replace('%sd',this.sourceDestPath())
				.replace('%s',this.serviceName())
				.replace('%e',XslHelper.EXTENSION_XSL);
}
XslHelper.prototype.companyExists=function(){
	if(!XslHelper.isDir(this.companyPath()))
		return false;
	else
		return true;
}
XslHelper.prototype.migrExists=function(){
	return this.companyExists() && XslHelper.isDir(this.migrPath());
}
XslHelper.prototype.sourceDestExists=function(){
	
	return this.migrExists() && XslHelper.isDir(this.sourceDestPath());
}
XslHelper.prototype.serviceExists=function(){
	
	return this.sourceDestExists() && fs.existsSync(this.servicePath());
}
XslHelper.prototype.read=function(){
	
	if(!this.serviceExists()) throw new XslError(500,'ERR-XXX-xxxx','Service %s doesnot exist. Please upload.'.replace(
		'%s',this.serviceName()
	));
	var self=this;
	return new Promise(function(resolve,reject){
		fs.readFile(self.servicePath(),'utf-8',(err,data)=>{
			if(err) reject(new XslError(500,'ERR-XXX-xxxx','Unable to read XSL file.'));
			else resolve(data);
		});
	});
}
XslHelper.prototype.upload=function(xml){
	return this.read().then((xsl)=>{
		var libxslt = require('libxslt');
		libxslt.parse(xsl,(err,stylesheet)=>{
			stylesheet.apply(xml, function(err, result){
    		// err contains any error from parsing the document or applying the stylesheet
    		// result is a string containing the result of the transformation
    			console.log(result);
	  		});
		});
		
	});
}
module.exports=exports=XslHelper;