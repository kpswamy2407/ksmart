const express=require('express');
var router=express.Router();
const bodyParser=require('body-parser');
var xmlBodyParser=require('express-xml-bodyparser');
const HttpError=require('./../error/HttpError.js');
const DownloadHelper=require('../helper/downloadHelper');
require('dotenv').config();

const xDistDeviceRegister=require('./../helper/xDistDeviceRegister');
router.post('/:domain/xdistdeviceregistration',xmlBodyParser({
	trim: false, explicitArray: false,
}),function(req, res, next) {
	var accept=[
		'application/xml',
		'text/xml',
		'application/json',
	];
	if( !accept.includes(req.get('Content-Type')) )
		throw new HttpError(404,'ERR-xx-xxxx','Invalid Content-Type request header.');
	var xddr=new xDistDeviceRegister(req.params.domain,req.body);
	try{
		xddr.setBasePath(process.env.DOMAINS_XML_PATH);
		xddr.register().then((count)=>{
			res.status(200).json({
				collections:{
					Count: count,
				}
			});
		}).catch(e=>{
			next(new HttpError(500,'ERR-xx-xxxx',e.message));
		});
	}
	catch(e){
		throw new HttpError(500,'ERR-xx-xxxx',e.message);
	}
});
router.get('/:domain/mobile/:key',DownloadHelper.getResult);
router.post('/:domain/:service',function(req, res, next) {
	const XslHelper=require('./../helper/XslHelper');
	var xslh=new XslHelper();
	try{
		xslh.upload();
	}
	catch(e){
		throw new HttpError(500,'ERR-xx-xxxx',e.message);
	}
});
module.exports = router;
