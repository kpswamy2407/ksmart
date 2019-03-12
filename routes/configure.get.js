require('dotenv').config();
module.exports=(req,res,next)=>{
	const ConfigHelper=require('./../helper/ConfigHelper.js');
	var config=new ConfigHelper(req.params.domain);
	try{
		config.setBasePath(process.env.DOMAINS_XML_PATH);
		var file=config.configPath(req.params.config);
		res.sendFile(file);
	}
	catch(e){
		res.status(500).end();
	}
};