const express=require('express');
var router=express.Router();
const bodyParser=require('body-parser');
var xmlBodyParser=require('express-xml-bodyparser');
const HttpError=require('./../error/HttpError.js');

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
	res.end();
});
module.exports = router;
