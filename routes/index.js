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
module.exports = router;
