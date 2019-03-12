var express=require("express");
var routes=express.Router();
const Sequelize = require('sequelize');
const AuthHelper=require('../helper/authHelper');
const authHelper=new AuthHelper();
const IoHelper=require('../helper/ioHelper');
const RedisHelper=require('../helper/redisHelper');
const ioHelper=new IoHelper();
const redisHelper=new RedisHelper();
routes.get('/:domain/Authentication', function(req, res, next) {
   try{
      var authToken=authHelper.getMd5(authHelper.getRandomString());
      var salt=authHelper.getMd5(authHelper.getRandomString());
      redisHelper.setValue(authToken+'_'+req.ip,salt,process.env.REDIS_MIN_TTL);
      var data={};
      data.authtoken=authToken;
      data.dynasalt=salt;
      var isXMLResponse=(req.query.extjson=='true')?false:true;
      ioHelper.getSuccessResponse({'collection':{'authentication':data,'rowcount':''}},isXMLResponse,res);
   }catch(error){
      ioHelper.getErrorResponse(error,true,res);
   }
});
routes.post('/:domain/Authentication',(req,res,next)=>{
   const ConfigHelper=require('../helper/ConfigHelper')
   var configHelper=new ConfigHelper();
   configHelper.setBasePath(process.env.DOMAINS_XML_PATH);
   try {
      switch (req.get('content-type')) {
            case 'application/xml':
            case 'text/xml':
            case 'application/json':
               const input=req.body.collections.authentication;
               switch (input.ldapentitytype) {
                    case 'userprofile':
                      console.log(configHelper.load(req.params.domain,'dms').getKey('centralmastermysqluser')) 
                       break;
                    case 'distributorprofile':
                       
                       break;
                    case 'salesmanprofile':
                       
                       break;
                    default:
                    ioHelper.getErrorResponse({'Error':'Invalid LDAP Entity Type'},true,res);
                       break;
               }
                
                break;
    
            default:
            console.log('deful');
                ioHelper.getErrorResponse({'Error':'Invalid input format'},true,res);
            break;
    }
   } catch (error) {
    ioHelper.getErrorResponse(error,true,res);
   }
});
//This is for testing purspose only
routes.get('/:domain/authverifiy',(req,res,next)=>{
    res.send(authHelper.verifyJwtToken(req.query.auth_token,req.params.domain))
})
module.exports=routes;