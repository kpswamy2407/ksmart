var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var authRouter=require('./routes/auth');

var xmlBodyParser=require('express-xml-bodyparser');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use('/run-query/',require('./routes/run-query'));
const AuthFilter=require('./filter/AuthFilter.js');
app.use(AuthFilter);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
// app.use(xmlBodyParser())

app.use('/cmf-1.0.0/', indexRouter);
app.use('/cmf-1.0.0/users', usersRouter);
app.use('/cmf-1.0.0/auth',authRouter);
app.use('/cmf-1.0.0/esb',require('./routes/esbRouter.js'));
/*app.use('/migration',migrationRouter);*/
const bodyParser=require('body-parser');
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});
// error handler
const HttpError=require('./error/HttpError.js');
const jsontoxml=require('jsontoxml');
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

module.exports = app;
