// export MOCHA=/var/www/html/ksmart/node_modules/mocha/bin/mocha
// clear; $MOCHA ConfigHelper.test.js
const assert=require('assert');
const ConfigHelper=require('./../ConfigHelper.js');
describe('ConfigHelper.js',function(){
	describe('#setBasePath()',function(){
		var cm=new ConfigHelper();
		it('should return undefined if value is valid drectory',function(){
			assert.equal(cm.setBasePath('./runtime'),undefined);
		});
		it('should throw error if value is an invalid path',function(){
			assert.throws(()=>{
				cm.setBasePath('./runtime-0');
			},Error);
			assert.throws(()=>{
				cm.setBasePath('i-dont-exist');
			},Error);
			assert.throws(()=>{
				cm.setBasePath('./i-dont-exist');
			},Error);
		});
		it('should throw error if value is a file',function(){
			assert.throws(()=>{
				cm.setBasePath('./runtime/db.config.xml');
			},Error);
		});
	});
	describe('#getBasePath()',function(){
		it('should return the path which was set before',function(){
			var path='./runtime';
			var cm=new ConfigHelper();
			cm.setBasePath(path);
			assert.equal(cm.getBasePath(),path);
		});
		it('should return the path which was set before',function(){
			var cm=new ConfigHelper();
			assert.throws(()=>{
				cm.getBasePath();
			},Error);
		});
	});
});