const fs=require('fs');
const jsontoxml=require('jsontoxml');
const libxslt=require('libxslt');
const FILE_JSON='./assets/GSKL0002/mobile_to_sp/vtiger_xrsr/vtiger_xrsr.json';
const FILE_XSL='./assets/GSKL0002/mobile_to_sp/vtiger_xrsr/vtiger_xrsr.xsl';
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
	console.log(xml);
}).catch(eerr=>{
	console.log(eerr.message);
});