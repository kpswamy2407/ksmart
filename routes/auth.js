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
      const sequelize = new Sequelize('forumnxt_sp', 'root', 'root', {
         host: 'localhost',
         dialect: 'mysql',
         port:3306
       });
       var authToken=req.query.auth_token;
       var domain=req.params.domain;
       var isXMLResponse=(req.query.extjson=='true')?false:true;
       var response={};
      switch (req.get('content-type')) {
            case 'application/xml':
            case 'text/xml':
            case 'application/json':
               const input=req.body.collections.authentication;
               switch (input.ldapentitytype) {
                    case 'userprofile':
                    //check if the dynasalt is valid or not
                    redisHelper.getValue(req.query.auth_token+"_"+req.ip).then(dynasaltValue=>{
                     if(dynasaltValue){
                        var query="select case when vtiger_users.status='Active' then 1 else 0 end as isactive ,user_password as password , vtiger_role.rolename as role FROM vtiger_users inner join vtiger_user2role on vtiger_user2role.userid=vtiger_users.id inner join vtiger_role on vtiger_role.roleid=vtiger_user2role.roleid where deleted=0 and user_name=:user_name";
                        sequelize.query(query,{replacements:{user_name:input.user_name},type: Sequelize.QueryTypes.SELECT}).spread(user=>{
                           if(user){
                              if(input.user_password.toLocaleLowerCase()==authHelper.getMd5(user.password+dynasaltValue).toLocaleLowerCase()){
                                 if(user.isactive==1){
                                    redisHelper.setValue(authToken+"_"+req.ip+"token",authToken,process.env.REDIS_MAX_TTL)
                                    response.authusername=input.user_name;
                                    response.authtoken=authToken;
                                    response.aclrole=user.role;
                                    response.isactive=user.isactive;
                                    var apiKey=authHelper.getMd5(authHelper.getRandomString()+response.authusername+req.ip+authToken+domain);
                                    response.apikey=apiKey;
                                    redisHelper.setValue(authToken+"_"+req.ip+'_'+response.authusername);
                                    ioHelper.getSuccessResponse({'collection':response,"success":true},isXMLResponse,res);
                                 }
                                 else{
                                    ioHelper.getErrorResponse({'httpcode':401,'simplemessage':'Inactive User','errorcode':'ERR-AU-0001'},true,res) ; 
                                 }
                              }
                              else{
                                 ioHelper.getErrorResponse({'httpcode':401,'simplemessage':'Invalid Username OR Password','errorcode':'ERR-AU-0001'},true,res) ; 
                              }
                           }
                           else{
                              ioHelper.getErrorResponse({'httpcode':401,'simplemessage':'unable to fetch data from DB','errorcode':'ERR-AU-0005'},true,res) ;
                           }
                           
                        });
                     }
                     else{
                         ioHelper.getErrorResponse({'httpcode':404,'simplemessage':'Property info missing','errorcode':'ERR-AU-0005'},true,res) ;
                     }  
                    });
                    break;

                    case 'distributorprofile':
                        if(redisHelper.getValue(authToken+"_"+req.ip+"token")){
                           var query=""
                        }
                        else{
                           ioHelper.getErrorResponse({'httpcode':404,'simplemessage':'Property info missing','errorcode':'ERR-AU-0005'},true,res) ;
                        }
                       break;
                    case 'salesmanprofile':
                        if(redisHelper.getValue(authToken+"_"+req.ip+"token")){

                        }
                        else{
                           ioHelper.getErrorResponse({'httpcode':404,'simplemessage':'Property info missing','errorcode':'ERR-AU-0005'},true,res) ;
                        } 
                       break;
                    default:
                    ioHelper.getErrorResponse({'Error':'Invalid LDAP Entity Type'},true,res);
                       break;
               }
               
              
               break;
    
            default:
            
                ioHelper.getErrorResponse({'Error':'Invalid input format'},true,res);
            break;
      }
   } catch (error) {
    ioHelper.getErrorResponse(error,true,res);
   }finally{
      
   }
});
//This is for testing purspose only
routes.get('/:domain/authverifiy',(req,res,next)=>{
    res.send(authHelper.verifyJwtToken(req.query.auth_token,req.params.domain))
})
module.exports=routes;