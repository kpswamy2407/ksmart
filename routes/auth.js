var express = require("express");
var routes = express.Router();
const Sequelize = require('sequelize');
const AuthHelper = require('../helper/authHelper');
const authHelper = new AuthHelper();
const IoHelper = require('../helper/ioHelper');
const RedisHelper = require('../helper/redisHelper');
const ioHelper = new IoHelper();
const redisHelper = new RedisHelper();
require('dotenv').config();
const HttpError= require('../error/HttpError');
routes.get('/:domain/Authentication', function (req, res, next) {
  try {
    authHelper.getMd5(authHelper.getRandomString()).then(authToken=>{
      authHelper.getMd5(authHelper.getRandomString()).then(salt=>{
        redisHelper.setValue(authToken + '_' + req.ip, salt, process.env.REDIS_MIN_TTL);
        var data = {};
        data.authtoken = authToken;
        data.dynasalt = salt;
        var isXMLResponse = (req.query.format == 'extjson') ? false : true;
        ioHelper.getSuccessResponse({
          'collection': {
          'authentication': data,
          'rowcount': ''
          }
        }, isXMLResponse, res);
      });
    });
  } catch (error) {
    ioHelper.getErrorResponse(error, true, res);
  }
});
routes.post('/:domain/Authentication', (req, res, next) => {
  const ConfigHelper = require('../helper/ConfigHelper')
  var configHelper = new ConfigHelper(req.params.domain);
  configHelper.setBasePath(process.env.DOMAINS_XML_PATH);
  try {
    dbConfig = configHelper.load('dms');
    const sequelize = new Sequelize(dbConfig.getKey("centralmastermysqldatabase"), null, null, {
      dialect: 'mysql',
      replication: {
        write: {
          host: dbConfig.getKey("centralmastermysqlhost"),
          username: dbConfig.getKey("centralmastermysqluser"),
          password: dbConfig.getKey("centralmastermysqlpassword"),
          port: dbConfig.getKey("centralmastermysqlport")
        },
        read: {
          host: dbConfig.getKey("centralslavemysqlhost"),
          username: dbConfig.getKey("centralmastermysqluser"),
          password: dbConfig.getKey("centralmastermysqlpassword"),
          port: dbConfig.getKey("centralslavemysqlport")
        }
      }
    });

    var authToken = req.query.auth_token;
    var domain = req.params.domain;
    var isXMLResponse = (req.query.format == 'extjson') ? false : true;
    var response = {};
    switch (req.get('content-type')) {
      case 'application/xml':
      case 'text/xml':
      case 'application/json':
        const input = req.body.collections.authentication;
        const authConfig = configHelper.load('auth');
        switch (input.ldapentitytype) {
          case 'userprofile':
            redisHelper.getValue(req.query.auth_token + "_" + req.ip).then(dynasaltValue => {
              if(!dynasaltValue){
                throw new HttpError(404,"ERR-AU-0005","Property info missing")
              }
              var query = authConfig.getKey("userprofilesql").replace("$whereCondition", "user_name=:user_name");
                return sequelize.query(query, {
                  replacements: {
                    user_name: input.user_name
                  },
                  type: Sequelize.QueryTypes.SELECT
                }).spread(user=>{
                    authHelper.getMd5(user.password + dynasaltValue).then(savedPassword => {
                      if(input.user_password.toLowerCase() !== savedPassword.toLowerCase()){
                        throw new HttpError(401,'ERR-AU-0001','Invalid Username OR Password')
                      }
                      if(user.isactive!=1){
                       throw new HttpError(401,'ERR-AU-0001','Inactive User') 
                      }
                      redisHelper.setValue(authToken, authToken, process.env.REDIS_MAX_TTL)
                      response.authusername = input.user_name;
                      response.authtoken = authToken;
                      response.aclrole = user.role;
                      response.isactive = user.isactive;
                      response.status=true;
                      authHelper.getMd5(authHelper.getRandomString() + response.authusername + req.ip + authToken + domain).then(apiKey => {
                        response.apikey = apiKey;
                        redisHelper.setValue(authToken + "_apikey", apiKey,process.env.REDIS_MAX_TTL);
                        ioHelper.getSuccessResponse({
                          'collection': response,
                          "success": true
                        }, isXMLResponse, res);
                      });
                    }).catch(next);
                    
                });/*.catch(next);*/
            }).catch((er)=>{
              if(er instanceof HttpError) next(er);
              else next(new HttpError(500,"ERR-XX-xxxx",er.message));
            });            
          break;

          case 'distributorprofile':
            redisHelper.getValue(authToken).then(validToken=>{
              if(!validToken){
                throw new HttpError(404,"ERR-AU-0005","Property info missing")
              }
              var queryString="";
              Object.entries(input).forEach(([key, value]) => {
                if(key!='ldapentitytype'){
                  queryString=queryString+key+"='"+value+"' and ";
                }
              });
              queryString=queryString.trim(" ").slice(0,-3)
              sequelize.query(authConfig.getKey("distributorprofilesql").replace("$whereCondition",queryString),{ type: sequelize.QueryTypes.SELECT}).spread(queryRes=>{
                if(queryRes.isactive!=1){
                  throw new HttpError(401,'ERR-AU-0001','Inactive User')
                }
                redisHelper.setValue(authToken, authToken, process.env.REDIS_MAX_TTL)
                response.authusername =input.distributorid+input.clientid+input.cdkey+input.deviceuniquekey;

                response.authtoken = authToken;
                response.aclrole ="distributor";
                response.isactive =queryRes.isactive;
                response.status=true;
                authHelper.getMd5(authHelper.getRandomString() + response.authusername + req.ip + authToken + domain).then(apiKey => {
                  response.apikey = apiKey;
                  redisHelper.setValue(authToken + "_apikey", apiKey,process.env.REDIS_MAX_TTL);
                  ioHelper.getSuccessResponse({
                    'collection': response,
                    "success": true
                  }, isXMLResponse, res);
                }).catch(next);

              }).catch(next);
            }).catch(next);
           break;
          case 'salesmanprofile':
            redisHelper.getValue(authToken).then(validToken=>{
                if(!validToken){
                  throw new HttpError(404,"ERR-AU-0005","Property info missing")
                }
                var queryString="";
                Object.entries(input).forEach(([key, value]) => {
                  if(key!='ldapentitytype'){
                    queryString=queryString+key+"='"+value+"' and ";
                  }
                });
                queryString=queryString.trim(" ").slice(0,-3)
                sequelize.query(authConfig.getKey("salesmanprofilesql").replace("$whereCondition",queryString),{ type: sequelize.QueryTypes.SELECT}).spread(queryRes=>{
                  if(queryRes.isactive!=1){
                    throw new HttpError(401,'ERR-AU-0001','Inactive User')
                  }
                  redisHelper.setValue(authToken, authToken, process.env.REDIS_MAX_TTL)
                  response.authusername =input.salesmanid+input.clientid+input.cdkey+input.deviceuniquekey;

                  response.authtoken = authToken;
                  response.aclrole ="salesman";
                  response.isactive =queryRes.isactive;
                  response.status=true;
                  authHelper.getMd5(authHelper.getRandomString() + response.authusername + req.ip + authToken + domain).then(apiKey => {
                    response.apikey = apiKey;
                    redisHelper.setValue(authToken + "_apikey", apiKey,process.env.REDIS_MAX_TTL);
                    ioHelper.getSuccessResponse({
                      'collection': response,
                      "success": true
                    }, isXMLResponse, res);
                  }).catch(next);
                  
                }).catch(next);
            }).catch(next);
            break;
          default:
            throw new HttpError(400,'ERR-AU-XXXX','Invalid LDAP Entity Type');
            break;
        }
        break;

      default:
        throw new HttpError(400,'ERR-AU-XXXX','Invalid input format');
        break;
    }
  } catch (error) {
    
    throw new HttpError(400,'ERR-AU-XXXX',error.message);
    
  } finally {

  }
});
//This is for testing purspose only
routes.get('/:domain/authverifiy', (req, res, next) => {
  res.send(authHelper.verifyJwtToken(req.query.auth_token, req.params.domain))
});
routes.get('/test',(req,res,next)=>{
  res.json({'status':'Node application started'});
})
module.exports = routes;

