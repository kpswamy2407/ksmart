const express = require('express');
var router = express.Router();

require('dotenv').config();
const bodyParser=require('body-parser');
const HttpError=require('./../error/HttpError.js');
router.post('/:domain/management/xpathreference',bodyParser.raw({
	type:['application/xml','text/xml'],
	limit:'512mb'
}),function(req,res,next){

	if(typeof(req.query.dest)=="undefined")
		next(new HttpError(406,"ERR-CON-0000","destination can't be null or empty"));
	if(typeof(req.query.origin)=="undefined")
		next(new HttpError(406,"ERR-CON-0001","origin can't be null or empty"));
	if(typeof(req.query.entity)=="undefined")
		next(new HttpError(406,"ERR-CON-0002","entity can't be null or empty"));
	/*if(req.body.toString().length()==0)
		next(new HttpError(406,"ERR-CON-0003","input can't be null or empty"));
*/
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
router.get('/:domain/management/xpathreference',(req,res)=>{
	res.send(req.params);
})
module.exports = router;