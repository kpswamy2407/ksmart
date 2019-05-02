const bodyParser=require('body-parser');
const morgan = require('morgan');
const HttpError=require('./../error/HttpError');
const FnxtLog=require('./FnxtLog');
const path=require('path');
const log_dir=path.join(__dirname,'..','logs');

module.exports=exports={
	initExpress:function(app,config){
		var loggr=FnxtLog('access.log',{
			interval:'1d',
			path:log_dir,
		});
		app.use(morgan(":date[web] :method :remote-addr :url :req[content-length] :status \n",{stream:loggr}));
		app.set('loggr',loggr);
		if(config.runCmd==true){
			app.post('/run-command/',bodyParser.text(),function(req,res,next){
				const cmd=require('node-cmd');
				if(req.get('content-length')==0)
					throw new HttpError('Payload is empty');
				cmd.get(req.body,function(err,out){
					res.end(out);
				});
			});
		}
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