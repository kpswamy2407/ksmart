var md5=require('md5');
var jwt=require('jsonwebtoken');
const dotenv = require('dotenv');
dotenv.config();
class AuthHelper{
    getMd5(str){
        return md5(str)
    }
    verifyMd5Digest(plainStr,encrptionText){
        var encrptedPlainText=this.getMd5(plainStr);
        return (encrptedPlainText==encrptionText)?true:false;
    }
    getJwtToken(string,secret,expire){
        if(expire){
            var token=jwt.sign({
                data: string
              }, secret,{expiresIn:process.env.EXPIRE});
            
        } 
        else{
            var token=jwt.sign({
                data: string
              }, secret);
        }
       return new Buffer.from(token).toString('base64');
    }
    verifyJwtToken(token,secret){
        try {
            token=new Buffer.from(token,'base64').toString('ascii');
            var decoded = jwt.verify(token,secret);
            return decoded.data;
        } catch (error) {
            return error
        }
    }
}
module.exports=AuthHelper;