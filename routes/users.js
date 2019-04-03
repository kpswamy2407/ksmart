var express = require('express');
var router = express.Router();
const Sequelize = require('sequelize');
var stomp=require('stomp-client');
const bodyParser=require('body-parser');
/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
router.post('/test',bodyParser.raw({
	type:['application/xml','text/xml','text/plain'],
	limit:'2048mb'
}),(req,res,next)=>{
	const input=req.body.toString();
	console.log(input);
	 const sequelize = new Sequelize('mq', null, null, {
      dialect: 'mysql',
      replication: {
        write: {
          host: '127.0.0.1',
          username:'root',
          password:'root',
          port:3306
        },
        read: {
          host: '127.0.0.1',
          username:'root',
          password:'root',
          port:3306
        }
      }
    });
	return sequelize.query("Insert into test values ('test','"+input+"')").then(([results, metadata]) => {
  		res.json([results, metadata]);
  	});

});
router.post('/queue',(req,res,next)=>{
	try{
			var stompClient = new stomp('127.0.0.1', 61613, 'admin','admin');
		  	stompClient.connect(function(sessionId){
		    	console.log("STOMP client connected."+sessionId);
				stompClient.publish('nandha','body=swamy sss',"");  		
		  	});
	}
	catch(e){
		console.log(e);
	}

});

module.exports = router;
