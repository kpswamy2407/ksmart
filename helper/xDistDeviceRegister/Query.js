function Query(q,c){
	this.collc=c;
	this.getQuery=function(){
		return q;
	}
}
Query.getKey=function(collc,key){
	if(collc[key]==undefined)
		throw new Error('Key %s does NOT exist in the collections.'.replace('%s',key));
	return collc[key];
}
Query.prototype.whereCond=function(){
	var _cond='1';
	for(var field in this.collc){
		if( !['entitytype','deviceuniquekey'].includes(field) ){
			let __cond__=' AND #field# = :#field#'.replace('#field#',field);
			_cond+=__cond__.replace('#field#',field);
		}
	}
	return _cond;
}
Query.prototype.whenCond=function(){
	// Ensure whether deviceuniquekey is present.
	Query.getKey(this.collc,'deviceuniquekey');
	return 'deviceuniquekey= :deviceuniquekey';
}
Query.prototype.params=function(){
	var __params={};
	for(var field in this.collc){
		if( !['entitytype'].includes(field) ){
			__params[field]=this.collc[field];
		}
	}
	return __params;
}
Query.prototype.replace=function(){
	var _query=this.getQuery().replace('$whereCondition',this.whereCond());
	return _query.replace('$whenCondition',this.whenCond());
}
module.exports=exports=Query;