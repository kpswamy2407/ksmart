var xml=require('jsontoxml');
class ioHelper{
    getSuccessResponse(data,isXml,res){
        
        if(isXml){
            res.set('Content-Type', 'text/xml');
            res.send(xml(data));
        }
        else{
            res.json(data);
        }
    }
    getErrorResponse(message,isXml,res){
        if(isXml){
            res.set('Content-Type', 'text/xml');
            res.send(xml(message));
        }
        else{
            res.json(message);
        }
    }
}
module.exports=ioHelper;