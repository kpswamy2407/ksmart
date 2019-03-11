// export MOCHA=/var/www/html/ksmart/node_modules/mocha/bin/mocha
// clear; $MOCHA ConfigHelper.test.js
const fs=require('fs');
const rimraf=require('rimraf');
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
		it('should throw error if path was not set before',function(){
			var cm=new ConfigHelper();
			assert.throws(()=>{
				cm.getBasePath();
			},Error);
		});
	});
	describe('#isCompanyDir()',function(){
		const PATH='./runtime';
		const COMPANY='ISCOMPANYDIR';
		before(function(){
			fs.mkdirSync(PATH+'/'+COMPANY);
		});
		after(function(){
			fs.rmdirSync(PATH+'/'+COMPANY);
		});
		it('should return true if the directory exists under base path',function(){
			var ch=new ConfigHelper();
			ch.setBasePath(PATH);
			assert.equal(ch.isCompanyDir(COMPANY),true);			
		});
		it('should return false if the directory does not exists under base path',function(){
			var ch=new ConfigHelper();
			ch.setBasePath(PATH);
			assert.equal(ch.isCompanyDir('INVALIDCOMPDIR'),false);			
		});
	});
	describe('#mkCompanyDir()',function(){
		const PATH='./runtime';
		const COMPANY='ABCD';
		before(function(){
			if(fs.existsSync(PATH+'/'+COMPANY)){
				fs.rmdirSync(PATH+'/'+COMPANY);
			}
		});
		after(function(){
			if(fs.existsSync(PATH+'/'+COMPANY)){
				fs.rmdirSync(PATH+'/'+COMPANY);
			}
		});
		it('should return true if company folder has been created',function(){
			var ch=new ConfigHelper();
			ch.setBasePath(PATH);
			assert.equal(ch.mkCompanyDir(COMPANY),true);
		});
		it('should return true if company folder already exists',function(){
			var ch=new ConfigHelper();
			ch.setBasePath(PATH);
			assert.equal(ch.mkCompanyDir(COMPANY),true);
		});
		it('should throw error while trying to create company folder without basepath',function(){
			var ch=new ConfigHelper();
			assert.throws(()=>{
				ch.mkCompanyDir(COMPANY);
			},Error);
		});
	});
	describe('#save()',function(){
		const PATH='./runtime';
		const COMPANY='ABCD';
		before(function(){
			if(fs.existsSync(PATH+'/'+COMPANY)){
				fs.rmdirSync(PATH+'/'+COMPANY);
			}
		});
		after(function(){
			if(fs.existsSync(PATH+'/'+COMPANY)){
				rimraf(PATH+'/'+COMPANY,_=>{});
			}
		});
		it('should return true if config xml has been created under company folder',function(){
			var ch=new ConfigHelper();
			ch.setBasePath(PATH);
			ch.mkCompanyDir(COMPANY);
			ch.setBasePath(PATH+'/'+COMPANY);
			var data=fs.readFileSync('./runtime/db.config.xml',{encoding:'utf-8'});
			assert.equal(ch.save('dms',data),undefined);
		});
	});
});