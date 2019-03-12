var md5=require('md5');
var sha1=require('sha1');
var randomString=require('randomstring');
const dotenv = require('dotenv');
dotenv.config();
class AuthHelper{
    getMd5(str){
        return new Promise((reslove,reject)=>{
            reslove(md5(str))
        });
    }
    verifyMd5Digest(plainStr,encrptionText){
        var encrptedPlainText=this.getMd5(plainStr);
        return (encrptedPlainText==encrptionText)?true:false;
    }
    getRandomString(){
        return randomString.generate({
            charset:'abcdef0123456789',
            length:7
        })+Date.now().toString();
    }
    
}
module.exports=AuthHelper;