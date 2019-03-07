function dbHelper(){

}
dbHelper.setDb=function(seq){
	this.__SEQUELIZE=seq;
}
dbHelper.getDb=function(){
	if(this.__SEQUELIZE==undefined) throw new Error('Sequelize DbConnection has NOT been set.');
	return this.__SEQUELIZE;
}
dbHelper.setModel=function(model){
	this.__MODEL=model;
}
dbHelper.getModel=function(){
	if(this.__MODEL==undefined) throw new Error('Sequelize model has NOT been set.');
	return this.__MODEL;
}
dbHelper.__prepareFields=function(fields){
	var __attr={};
	var __removeIdAttr=true;
	fields.forEach((f)=>{
		if(f.Field=='id'){
			__attr[f.Field]={
				type:f.Type,
				primaryKey: (f.Key=='PRI')? true:false,
			};
			__removeIdAttr=false;
		}else{
			__attr[f.Field]=f.Type;
		}
	});
	return {
		attr:__attr,
		removeIdCol:__removeIdAttr
	};
}
dbHelper.__defineModel=function(tbl,fields){
	var __MODEL=this.getDb().define(tbl,fields.attr,{
		freezeTableName:true,
		timestamps:false,
	});
	if(fields.removeIdCol) __MODEL.removeAttribute('id');
	return __MODEL;

}
dbHelper.define=function(tbl){
	var _spread=this.__prepareFields.bind(this);
	var _then=this.__defineModel.bind(this,tbl);
	return this.getDb().query('SHOW FULL COLUMNS FROM '+tbl).spread(_spread).then(_then);

}
module.exports=exports=dbHelper;