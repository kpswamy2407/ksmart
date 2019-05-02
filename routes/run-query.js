const express=require('express');
const router=express.Router();
const bodyParser=require('body-parser');
const HttpError= require('../error/HttpError');
const utils=require('./../utils');

router.post('/:company',utils.hasPayload(),bodyParser.text(),function(req, res, next) {
	const ConfigHelper=require('./../helper/ConfigHelper');
	const Sequelize=require('sequelize');
	var sql,company,dms;
	if(req.get('content-type')!='text/plain')
		throw new HttpError(400,'FN-XX-xxxx','Invalid payload Content-type.');
	sql=req.body;
	company=req.params.company;
	var ch=new ConfigHelper(company);
	ch.setBasePath(process.env.DOMAINS_XML_PATH);
	const sequelize=ch.getDb();
	sequelize.query(sql).then(result => {
		res.jsonp(result);
	}).catch((er)=>{
		next(new HttpError(500,'FN-XX-xxxx',er.message));
	});
});
module.exports = router;
