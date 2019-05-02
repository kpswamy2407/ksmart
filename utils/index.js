const bodyParser=require('body-parser');
const morgan = require('morgan');
const HttpError=require('./../error/HttpError');
const FnxtLog=require('./FnxtLog');
const path=require('path');
const log_dir=path.join(__dirname,'..','logs');

module.exports=exports={
	FnxtLog: FnxtLog,
	initExpress:function(app,config){
		var loggr=FnxtLog('access.log',{
			interval:'1d',
			path:log_dir,
		});
		app.use(morgan(":date[web] :method :remote-addr :url :req[content-length] :status \n",{stream:loggr}));
		app.set('loggr',loggr);
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
	},
	hasPayload:function(){
		return function(req,res,next){
			if(req.get('content-length')==0){
				throw new HttpError(404,'ERR-xx-xxxx','Request body is empty.');
			}else{
				next();
			}
		}
	}
}