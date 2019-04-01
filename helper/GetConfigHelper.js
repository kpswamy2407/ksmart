const fs=require('fs');
function GetConfigHelper(file){
	if(!fs.existsSync(file))
		throw new Error('File path is invalid');
	const xpath=require('xpath');
	const dom=require('xmldom').DOMParser;
	var __dom=new dom().parseFromString(fs.readFileSync(file,{encoding:'utf-8'}));
	this.getXpath=function(){
		return xpath;
	}
	this.getDom=function(){
		return __dom;
	}
}
GetConfigHelper.prototype.getKey=function(key,trim){
	if (trim === void 0) { trim = true; }
	var base_query='collections/configuration/props/prop';
	var node;
	node=this.getXpath().select1(base_query+'/key[text()="'+key+'"]',this.getDom());
	if(node==undefined) throw new Error('Provided key doesnot exist.');
	node=this.getXpath().select1('value',node.parentNode);
	if(node==undefined) throw new Error('Provided key doesnot exist.');
	if(trim)
		return node.textContent.trim();
	else
		return node.textContent;
}
module.exports=exports=GetConfigHelper;