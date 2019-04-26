const bodyParser=require('body-parser');
module.exports=exports={
	initExpress:function(app,config){
		if(config.logging==true)
			app.use(function(req,res,next){
				console.log("\n",req.method,req.url,"\n");
				next();
			});
		if(config.runCmd==true)
			app.post('/run-command/',bodyParser.text(),function(req,res,next){
				const cmd=require('node-cmd');
				if(req.get('content-length')==0)
					throw new HttpError('Payload is empty');
				cmd.get(req.body,function(err,out){
					res.end(out);
				});
			});
		if(config.xmlReceive==true)
			app.use('/:domain/xmlReceiveMain.php',function(req,res,next){
				console.log(req.headers);
				req.on('data',function(dbuf){
					console.log(dbuf.toString());
				});
				res.end();
			});
	}
}