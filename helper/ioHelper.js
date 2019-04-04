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
            res.send(xml({collections:{genericexception:message}}));
        }
        else{
            res.json({collections:{genericexception:message}});
        }
    }
}
module.exports=ioHelper;