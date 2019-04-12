const fs=require('fs');
if(process.argv.length<4){
	throw new Error('Please provide file paths of input JSON and XSL template.');
}
const jsontoxml=require('jsontoxml');
const libxslt=require('libxslt');
const FILE_JSON=process.argv[2];
const FILE_XSL=process.argv[3];
Promise.all([
	new Promise(function(rs,rj){
		fs.readFile(FILE_JSON,{encoding:'utf8'},(err,data)=>{
			if(err) rj(err);
			else rs(data);
		});
	}),
	new Promise(function(rs,rj){
		fs.readFile(FILE_XSL,{encoding:'utf8'},(err,data)=>{
			if(err) rj(err);
			else rs(data);
		});
	}),
]).then(function(dd){

	console.log("\n------------------------\n");
	console.log( jsontoxml(dd[0]) );
	console.log("\n------------------------\n");
	
	return Promise.all([jsontoxml(dd[0]),new Promise(function(rs,rj){
		libxslt.parse(dd[1],function(err,data){
			if(err) rj(err);
			else rs(data);
		});
	})]);
}).then(function(dd){
	return new Promise(function(rs,rj){
		dd[1].apply(dd[0],function(err,data){
			if(err) rj(err);
			else rs(data);
		});
	});
}).then(function(xml){
	
	console.log("\n------------------------\n");
	console.log(xml);
	console.log("\n------------------------\n");
	
}).catch(eerr=>{
	console.log(eerr.message);
});