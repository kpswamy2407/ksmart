const express = require('express');
const router = express.Router();
const bodyParser=require('body-parser');
const HttpError=require('./../error/HttpError.js');
const utils=require('./../utils');

router.get('/:config/:domain/management/configuration',function(req,res,next){
	const loggr=req.app.get('loggr');
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.logger(loggr);
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		var file=config.configPath(req.params.config);
		res.sendFile(file);
	}
	catch(err){
		loggr.log(err.message);
		throw new HttpError(500,'ERR-XX-XXXX','Unable to load domain configuration.');
	}
});
router.post('/:config/:domain/management/configuration',utils.hasPayload(),bodyParser.raw({
	type:['application/xml','text/xml'],
	limit:'512mb'
}),function(req,res,next){
	const loggr=req.app.get('loggr');
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.logger(loggr);
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		config.createCompany();
		config.save(req.params.config,req.body.toString());
		res.end();
	}
	catch(err){
		loggr.log(err.message);
		throw new HttpError(500,'ERR-XX-XXXX',err.message);
	}
});
router.post('/migration/:domain/management/xpathreference',utils.hasPayload(),bodyParser.raw({
	type:['application/xml','text/xml'],
	limit:'512mb'
}),function(req,res,next){
	const loggr=req.app.get('loggr');
	var q=req.query;
	if(q.dest==undefined)
		throw new HttpError(406,"ERR-CON-0000","destination can't be null or empty");
	if(q.origin==undefined)
		throw new HttpError(406,"ERR-CON-0001","origin can't be null or empty");
	if(q.entitytype==undefined)
		throw new HttpError(406,"ERR-CON-0002","entitytype can't be null or empty");
	if(req.body.toString().length==0)
		throw new HttpError(406,"ERR-CON-0003","input can't be null or empty");
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.logger(loggr);
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		config.createCompany();
		config.setMigrationBasePath(process.env.DOMAINS_XSLT);
		config.saveXsl(q.origin,q.dest,q.entitytype,req.body.toString()).then(result=>{
			res.end();
		}).catch(err=>{
			loggr.log(err.message);
			next(new HttpError(500,'ERR-XX-XXXX',err.message));	
		});
	}
	catch(err){
		loggr.log(err.message);
		throw new HttpError(500,'ERR-XX-XXXX',err.message);
	}
});
router.get('/migration/:domain/management/xpathreference',function(req,res,next){
	if(req.query.dest==undefined)
		throw new HttpError(406,"ERR-CON-0000","destination can't be null or empty");
	if(req.query.origin==undefined)
		throw new HttpError(406,"ERR-CON-0001","origin can't be null or empty");
	if(req.query.entitytype==undefined)
		throw new HttpError(406,"ERR-CON-0002","entitytype can't be null or empty");
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	const loggr=req.app.get('loggr');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.logger(loggr);
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		config.setMigrationBasePath(process.env.DOMAINS_XSLT);
		config.configXSLPath(req.query.origin,req.query.dest,req.query.entitytype).then(file=>{
			res.sendFile(file);
		}).catch(err=>{
			loggr.log(err.message);
			next(new HttpError(500,'ERR-XX-XXXX','Unable to load domain configuration.'));	
		});
	}
	catch(err){
		loggr.log(err.message);
		throw new HttpError(500,'ERR-XX-XXXX','Unable to load domain configuration.');
	}
});
module.exports = router;
