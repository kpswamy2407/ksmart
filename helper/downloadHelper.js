const ConfigHelper=require('./ConfigHelper')
const IoHelper=require('./ioHelper');
const ioHelper=new IoHelper();
const HttpError=require('./../error/HttpError.js');
function DownloadHelper(){
    
}
DownloadHelper.NullToEmptyString=function(collc) {
    for(var i in collc){
        switch(typeof collc[i]){
            case 'object':
                if(collc[i]===null){
                    collc[i]="";
                }else{
                    collc[i]=DownloadHelper.NullToEmptyString(collc[i]);
                }
            break;
            default:
                collc[i]=(collc[i]===null)?"":collc[i];     
            break;
        }       
    }
    return collc;
}
DownloadHelper.NumberToString=function(collc) {
    for(var i in collc){
        switch(typeof collc[i]){
            case 'number':
                collc[i]=collc[i].toString();
            break;
            case 'object':
                if(collc[i]===null){
                    collc[i]=collc[i];
                }else{
                    collc[i]=DownloadHelper.NumberToString(collc[i]);
                }
            break;
            default:
                collc[i]=collc[i];
            break;
        }
    }
    return collc;
}
DownloadHelper.getResult = function(req,res,next) {
    var configHelper=new ConfigHelper(req.params.domain);
    const loggr=req.app.get('loggr');
    configHelper.setBasePath(process.env.DOMAINS_XML_PATH);
    configHelper.logger(loggr);
    downloadConfig=configHelper.load('mobile');
    try{
        var query=downloadConfig.getKey(req.params.key);   
    }catch(e){
        loggr.log(e.message);
        throw new HttpError(404,'FN-XX-xxxx','Service "'+req.params.key+'" is not available.');
    }
    try{
        var isXMLResponse = (req.query.format == 'extjson') ? false : true;
        var queryMetaKeys=query.match(/#\$[a-zA-Z]{1,}#/gm);
        if(queryMetaKeys!==null){
            for (var i = queryMetaKeys.length - 1; i >= 0; i--) {
                var qkey=queryMetaKeys[i].replace(/#/g,"").replace("$","");
                query=query.replace(queryMetaKeys[i],req.query[qkey]);
            }
        }
        var l,o;
        if((l=req.query.limit)!==undefined){
            query+=' LIMIT '+l;
            if((o=req.query.offset)!==undefined){
                query+=' OFFSET '+o;
            }
        }
        const db=configHelper.getDb();
        var queryResult;
        if(/[a-zA-Z]{1,}count$/.test(req.params.key)){
            queryResult=db.query(query,{type: db.QueryTypes.SELECT}).spread(count=>{
                for(var key in count){
                    count[key]=count[key].toString();
                }
                ioHelper.getSuccessResponse({collections:{response:count,rowcount:"1"}},isXMLResponse,res)
            }); 
        }
        else{
            queryResult=db.query(query,{type: db.QueryTypes.SELECT}).then(result=>{
                result={collections:{response:result,rowcount:result.length}};
                result=DownloadHelper.NullToEmptyString(result);
                result=DownloadHelper.NumberToString(result);
                ioHelper.getSuccessResponse(result,isXMLResponse,res);
            });
        }
        queryResult.catch((err)=>{
            loggr.log(err.message);
            next(new HttpError(500,'ERR-CON-0021','Unknown error occured'));
        }).finally(()=>{
            db.close();
        });
    }
    catch(err){
        loggr.log(err.message);
        throw new HttpError(500,'FN-XX-xxxx',err.message);
    }
};
module.exports=DownloadHelper;