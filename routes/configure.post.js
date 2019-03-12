require('dotenv').config();
module.exports=(req,res,next)=>{
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper();
	try{
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		config.mkCompanyDir(req.params.domain);
		config.setBasePath(process.env.DOMAINS_XML_PATH+'/'+req.params.domain);
		config.save(req.params.config,req.body.toString());
		res.end();
	}
	catch(e){
		res.status(500).end();
	}
};