require('dotenv').config();
const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const HttpError=require('./error/HttpError.js');
const jsontoxml=require('jsontoxml');

/** Express APP construct **/
var app = express();
require('./utils').initExpress(app,{
	runCmd:true,
});
// view engine setup
app.set('views',path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use('/run-query/',require('./routes/run-query'));
app.use('/logs',function(req,res,next){
	res.sendFile(path.join(__dirname,'logs','access.log'));
	return;
});
const AuthFilter=require('./filter/AuthFilter.js');
app.use(AuthFilter);
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
/** Routes **/
app.use('/cmf-1.0.0/',require('./routes/index'));
app.use('/cmf-1.0.0/users',require('./routes/users'));
app.use('/cmf-1.0.0/auth',require('./routes/auth'));
app.use('/cmf-1.0.0/esb',require('./routes/esbRouter.js'));
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});
// error handler
app.use(function(err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};
	// render the error page
	if(err instanceof HttpError){
		res.status(err.statusCode);
		res.send(jsontoxml({
			collections:{
				genericexception:{
					httpcode:err.statusCode,
					simplemessage:err.message,
					errorcode:err.fnxtCode,
				}
			}
		}));
	}else{
		res.status(err.status || 500);
		res.render('error');
	}
});
module.exports=app;
