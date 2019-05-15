const express=require('express');
const router=express.Router();
const bodyParser=require('body-parser');
const HttpError= require('../errors/HttpError');
const utils=require('./../utils');

router.post('/:company',utils.hasPayload(),bodyParser.text(),function(req, res, next) {
	const ConfigHelper=require('./../helper/ConfigHelper');
	const Sequelize=require('sequelize');
	var sql,company;
	const loggr=req.app.get('loggr');
	if(req.get('content-type')!='text/plain')
		throw new HttpError(400,'FN-XX-xxxx','Invalid payload Content-type.');
	sql=req.body;
	company=req.params.company;
	var ch=new ConfigHelper(company);
	try{
		ch.logger(loggr);
		ch.setBasePath(process.env.DOMAINS_XML_PATH);
		const sequelize=ch.getDb();
		sequelize.query(sql).then(result => {
			res.jsonp(result);
		}).catch((err)=>{
			loggr.log(err.message);
			next(new HttpError(500,'FN-XX-xxxx',err.message));
		});
	}catch(err){
		loggr.log(err.message);
		throw new HttpError(500,'FN-XX-xxxx',err.message);
	}
});
module.exports = router;
