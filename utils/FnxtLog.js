const RotatingFileStream=require('rotating-file-stream');
const util=require("util");

function FnxtLog(filename, options){
    if(! (this instanceof FnxtLog)) return new FnxtLog(filename, options);
    RotatingFileStream.call(this,filename,options);
}
FnxtLog.prototype.log = function (msg) {
    this.write(msg + "\n\n");
    return this;
};
util.inherits(FnxtLog,RotatingFileStream);
module.exports=exports=FnxtLog;
