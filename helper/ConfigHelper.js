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
module.exports=exports=ConfigHelper;