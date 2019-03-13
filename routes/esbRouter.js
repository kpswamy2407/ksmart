const express=require('express');
var router=express.Router();
const bodyParser=require('body-parser');
var xmlBodyParser=require('express-xml-bodyparser');
const HttpError=require('./../error/HttpError.js');
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
		xddr.register().then(()=>{
			res.status(200).end();
		}).catch(e=>{
			next(new HttpError(500,'ERR-xx-xxxx',e.message));
		});
	}
	catch(e){
		throw new HttpError(500,'ERR-xx-xxxx',e.message);
	}
});
module.exports = router;
