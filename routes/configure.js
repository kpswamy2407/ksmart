var express=require('express');
var routes=express.Router();

routes.get('/',(req,res)=>{
    res.send("response from configuressss");
});
routes.post('/',(req,res,next)=>{
    if(req.get('content-type')=='application/xml'||req.get('content-type')=='text/xml'||req.get('content-type')=='application/json'){
        console.log(req.body);
    }
});

module.exports=routes;