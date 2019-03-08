const dotenv = require('dotenv');
dotenv.config();
var redis=require('redis');
const redisClient=redis.createClient({host:process.env.REDIS_HOST,port:process.env.REDIS_PORT});

class RedisHelper{
    
    getValue(key){
        redisClient.get(key,(err,result)=>{
            if(err){
                return err
            }
            else{
                return result;
            }
        });
    }
    setValue(key,value,expire){
        redisClient.set(key,value,'EX',expire,(err,result)=>{
            if(err){
                console.log(err);
            }
            else{
                return true;
            }
        });
    } 
}
module.exports=RedisHelper;