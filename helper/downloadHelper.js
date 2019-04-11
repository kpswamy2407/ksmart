require('dotenv').config();
const ConfigHelper=require('./ConfigHelper')
const IoHelper=require('./ioHelper');
const ioHelper=new IoHelper();
const HttpError=require('./../error/HttpError.js');
function DownloadHelper(){
    
}
DownloadHelper.getResult = function(req,res,next) {
    var configHelper=new ConfigHelper(req.params.domain);
    configHelper.setBasePath(process.env.DOMAINS_XML_PATH);
    downloadConfig=configHelper.load('mobile');
    try{
        var query=downloadConfig.getKey(req.params.key);   
    }catch(e){
        next(new HttpError(404,'FN-XX-xxxx','Service "'+req.params.key+'" is not available.'))
    }
    var isXMLResponse = (req.query.format == 'extjson') ? false : true;
    var queryMetaKeys=query.match(/#\$[a-zA-Z]{1,}#/gm);
    for (var i = queryMetaKeys.length - 1; i >= 0; i--) {
        var qkey=queryMetaKeys[i].replace(/#/g,"").replace("$","");
        query=query.replace(queryMetaKeys[i],req.query[qkey]);
    }
    configHelper.setLoggerFn(req.app.get('__fnxtlogger__'));
    const db=configHelper.getDb();
    var queryResult=db.query(query,{type: db.QueryTypes.SELECT});
    queryResult.catch(()=>{
        next(new HttpError(500,'ERR-CON-0021','Unknown error occured'));
    }).finally(()=>{
        db.close();
    });
    if(/[a-zA-Z]{1,}count$/.test(req.params.key)){
        queryResult.spread(count=>{
            ioHelper.getSuccessResponse({collections:{response:count,rowcount:1}},isXMLResponse,res)
        }); 
    }
    else{
        queryResult.then(result=>{
            ioHelper.getSuccessResponse({collections:{response:result,rowcount:result.length}},isXMLResponse,res)
        });
    }

    
};
module.exports=DownloadHelper;