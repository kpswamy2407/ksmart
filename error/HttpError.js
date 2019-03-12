class HttpError extends Error{
	constructor(code,fnxtCode,msg){
		super(msg);
		this.statusCode=code;
		this.fnxtCode=fnxtCode;
	}
}
module.exports=exports=HttpError;