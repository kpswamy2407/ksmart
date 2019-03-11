// export MOCHA=/var/www/html/ksmart/node_modules/mocha/bin/mocha
// clear; $MOCHA GetConfigHelper.test.js
const fs=require('fs');
const assert=require('assert');
const GetConfigHelper=require('./../GetConfigHelper.js');
describe('GetConfigHelper',function(){
	describe('Constructor',function(){
		it('should create new instance if the file path is valid',function(){
			var gch=new GetConfigHelper('./runtime/db.config.xml');
			assert.equal(gch instanceof GetConfigHelper,true)
		});
		it('should throw error if invalid file path is given',function(){
			assert.throws(()=>{
				var gch=new GetConfigHelper('./runtime/no-exists.xml');
			},Error);
		});
	});
	describe('#getKey()',function(){
		it('should return the value if the x-path is valid',function(){
			var gch=new GetConfigHelper('./runtime/db.config.xml');
			assert.equal(gch.getKey('centralmastermysqldatabase'),'GLOW1101');
			assert.equal(gch.getKey('spmastermysqlport'),3306);
			assert.equal(gch.getKey('centralslavemysqlhost'),'223.30.223.71');
		});
		it('should throw error if the x-path is invalid',function(){
			var gch=new GetConfigHelper('./runtime/db.config.xml');
			assert.throws(()=>{
				gch.getKey('invalid-key');
			},Error);
		});
	});
});