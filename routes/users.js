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
module.exports = router;
