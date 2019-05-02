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
	dms=ch.loadDms();
	const sequelize = new Sequelize(dms.getKey("centralmastermysqldatabase"), null, null, {
		dialect: 'mysql',
		replication: {
			write: {
				host: dms.getKey("centralmastermysqlhost"),
				username: dms.getKey("centralmastermysqluser"),
				password: dms.getKey("centralmastermysqlpassword"),
				port: dms.getKey("centralmastermysqlport")
			},
			read: {
				host: dms.getKey("centralslavemysqlhost"),
				username: dms.getKey("centralmastermysqluser"),
				password: dms.getKey("centralmastermysqlpassword"),
				port: dms.getKey("centralslavemysqlport")
			}
		},
		logging:req.app.get('__fnxtlogger__'),
		dialectOptions:{
            dateStrings: true,
            typeCast: true
		}
	});
	sequelize.query(sql).then(result => {
		res.jsonp(result);
	}).catch((er)=>{
		next(new HttpError(500,'FN-XX-xxxx',er.message));
	});
});
module.exports = router;
