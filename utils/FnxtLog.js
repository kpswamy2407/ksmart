const RotatingFileStream=require('rotating-file-stream');
const util=require("util");

function FnxtLog(filename, options){
    if(! (this instanceof FnxtLog)) return new FnxtLog(filename, options);
    RotatingFileStream.call(this,filename,options);
}
FnxtLog.prototype.log = function (msg, sep) {
    if (sep === void 0) { sep = "\n\n"; }
    this.write(msg + sep);
    return this;
};
util.inherits(FnxtLog,RotatingFileStream);
module.exports=exports=FnxtLog;
