const express = require('express');
var router = express.Router();

require('dotenv').config();
const bodyParser=require('body-parser');
const HttpError=require('./../error/HttpError.js');

router.get('/:config/:domain/management/configuration',function(req,res,next){
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		var file=config.configPath(req.params.config);
		res.sendFile(file);
	}
	catch(e){
		next(new HttpError(500,'ERR-XX-XXXX','Unable to load domain configuration.'));
	}
});
router.post('/:config/:domain/management/configuration',bodyParser.raw({
	type:['application/xml','text/xml'],
	limit:'512mb'
}),function(req,res,next){
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		config.createCompany();
		config.save(req.params.config,req.body.toString());
		res.end();
	}
	catch(e){
		next(new HttpError(500,'ERR-XX-XXXX',e.message));
	}
});
router.post('/migration/:domain/management/xpathreference',bodyParser.raw({
	type:['application/xml','text/xml'],
	limit:'512mb'
}),function(req,res,next){
	if(req.query.dest==undefined)
		throw new HttpError(406,"ERR-CON-0000","destination can't be null or empty");
	if(req.query.origin==undefined)
		throw new HttpError(406,"ERR-CON-0001","origin can't be null or empty");
	if(req.query.entity==undefined)
		throw new HttpError(406,"ERR-CON-0002","entity can't be null or empty");
	if(req.body.toString().length==0)
		throw new HttpError(406,"ERR-CON-0003","input can't be null or empty");
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		config.createCompany();
		config.setMigrationBasePath(process.env.DOMAINS_XSLT);
		config.saveXSLTFile(req.query.origin,req.query.dest,req.query.entity,req.body.toString()).then(result=>{
			res.send()
		}).catch(error=>{
			next(new HttpError(500,'ERR-XX-XXXX',error.message));	
		})
		res.end();
	}
	catch(e){
		next(new HttpError(500,'ERR-XX-XXXX',e.message));
	}
});
router.get('/migration/:domain/management/xpathreference',function(req,res,next){
	if(req.query.dest==undefined)
		next(new HttpError(406,"ERR-CON-0000","destination can't be null or empty"));
	if(req.query.origin==undefined)
		next(new HttpError(406,"ERR-CON-0001","origin can't be null or empty"));
	if(req.query.entity==undefined)
		next(new HttpError(406,"ERR-CON-0002","entity can't be null or empty"));

	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		config.setMigrationBasePath(process.env.DOMAINS_XSLT);
		config.configXSLPath(req.query.origin,req.query.dest,req.query.entity).then(file=>{
			res.sendFile(file);
		}).catch(e=>{
			next(new HttpError(500,'ERR-XX-XXXX','Unable to load domain configuration.'));	
		});
		
	}
	catch(e){
		
		next(new HttpError(500,'ERR-XX-XXXX','Unable to load domain configuration.'));
	}
});
module.exports = router;
