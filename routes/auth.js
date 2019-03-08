var express=require("express");
var routes=express.Router();
const Sequelize = require('sequelize');
const AuthHelper=require('../helper/authHelper');
const authHelper=new AuthHelper();
const IoHelper=require('../helper/ioHelper');
const ioHelper=new IoHelper();

routes.get('/:domain/Authentication', function(req, res, next) {
   try{
       var authToken=authHelper.getJwtToken(req.params.domain,req.params.domain,false);
       var salt=authHelper.getJwtToken(req.params.domain,req.params.domain,true);
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
   try {
      switch (req.get('content-type')) {
            case 'application/xml':
            case 'text/xml':
            case 'application/json':
               const input=req.body.collections.authentication;
               switch (input.ldapentitytype) {
                    case 'userprofile':
                       
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