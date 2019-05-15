const express=require('express');
const router=express.Router();
const bodyParser=require('body-parser');
const xmlBodyParser=require('express-xml-bodyparser');
const HttpError=require('./../errors/HttpError.js');
const DownloadHelper=require('../helper/downloadHelper');
const jsontoxml=require('jsontoxml');
const xDistDeviceRegister=require('./../helper/xDistDeviceRegister');
const utils=require('./../utils');

router.post('/:domain/xdistdeviceregistration',utils.hasPayload(),xmlBodyParser({
	trim: false, explicitArray: false,
}),function(req, res, next) {
	var accept=[
		'application/xml',
		'text/xml',
		'application/json',
		'application/json; charset=UTF-8',
	];
	const loggr=req.app.get('loggr');
	if( !accept.includes(req.get('Content-Type')) )
		throw new HttpError(404,'ERR-xx-xxxx','Invalid Content-Type request header.');
	var xddr=new xDistDeviceRegister(req.params.domain,req.body);
	try{
		xddr.logger(loggr);
		xddr.setBasePath(process.env.DOMAINS_XML_PATH);
		xddr.register().then((count)=>{
			res.status(200).json({
				collections:{
					Count: count,
				}
			});
		}).catch(err=>{
			loggr.log(err.message);
			next(new HttpError(err.codeNum,err.codeStr,err.message));
		});
	}
	catch(err){
		loggr.log(err.message);
		throw new new HttpError(err.codeNum,err.codeStr,err.message);
	}
});
router.get('/:domain/mobile/:key',DownloadHelper.getResult);
router.post('/:domain/:service',utils.hasPayload(),function(req, res, next) {
	var accept=[
		'application/xml',
		'text/xml',
		'application/json',
		'application/json; charset=UTF-8',
	];
	const loggr=req.app.get('loggr');
	if( !accept.includes(req.get('Content-Type')) )
		throw new HttpError(404,'ERR-xx-xxxx','Invalid Content-Type request header.');
	if(['application/json','application/json; charset=UTF-8'].includes(req.get('Content-Type'))){
		var input=req.body;
		input=jsontoxml(input);
	}
	else{
		var input=req.body
	}
	if(req.query.origin==undefined || req.query.origin==''){
		throw new HttpError(400,'ERR-xx-xxxx','Query params are missing. Invalid request.');
	}
	if(req.query.dest==undefined || req.query.dest==''){
		throw new HttpError(400,'ERR-xx-xxxx','Query params are missing. Invalid request.');
	}
	const XslHelper=require('./../helper/XslHelper');
	var xslh=new XslHelper();
	try{
		xslh.basePath(process.env.DOMAINS_XML_PATH);
		xslh.companyName(req.params.domain);
		xslh.migrationFolder(process.env.DOMAINS_XSLT);
		xslh.service=req.params.service;
		switch(xslh.service){
			case 'st_otp_details':
				xslh.isQueued=false;
			break;
			default:
				xslh.isQueued=true;
			break;
		}
		xslh.sourceDestName(req.query.origin,req.query.dest);
		xslh.upload(input).then((responseCode)=>{
			if(responseCode==200){
				res.status(200).json({
					collections:{
						Count: 0,
					}
				});
			}
			else{
				next(new HttpError(responseCode,'ERR-xx-xxxx',"invalid input data"))
			}
		}).catch(err=>{
			loggr.log(err.message);
			next(new HttpError(500,'ERR-xx-xxxx',err.message));
		});
	}
	catch(err){
		loggr.log(err.message);
		throw new HttpError(500,'ERR-xx-xxxx',err.message);
	}
});
router.post('/:domain/:service/test',utils.hasPayload(),function(req, res, next) {
	var accept=[
		'application/xml',
		'text/xml',
		'application/json',
	];
	const loggr=req.app.get('loggr');
	if( !accept.includes(req.get('Content-Type')) )
		throw new HttpError(404,'ERR-xx-xxxx','Invalid Content-Type request header.');
	if(req.get('Content-Type')=='application/json'){
		var input=req.body;
		input=jsontoxml(input);		
	}
	else{
		var input=req.body
	}
	if(req.query.origin==undefined || req.query.origin==''){
		throw new HttpError(400,'ERR-xx-xxxx','Query params are missing. Invalid request.');
	}
	if(req.query.dest==undefined || req.query.dest==''){
		throw new HttpError(400,'ERR-xx-xxxx','Query params are missing. Invalid request.');
	}
	const XslHelper=require('./../helper/XslHelper');
	var xslh=new XslHelper();
	try{
		xslh.basePath(process.env.DOMAINS_XML_PATH);
		xslh.companyName(req.params.domain);
		xslh.migrationFolder(process.env.DOMAINS_XSLT);
		xslh.service=req.params.service;
		xslh.sourceDestName(req.query.origin,req.query.dest);
		xslh.uploadTest(input).then((response)=>{
			res.status(200).json(response);
		}).catch(err=>{
			loggr.log(err.message);
			next(new HttpError(500,'ERR-xx-xxxx',err.message));
		});
	}
	catch(err){
		loggr.log(err.message);
		throw new HttpError(500,'ERR-xx-xxxx',err.message);
	}
});
module.exports = router;
