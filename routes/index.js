const express = require('express');
var router = express.Router();

const bodyParser=require('body-parser');

router.get('/:config/:domain/management/configuration',require('./configure.get'));
router.post('/:config/:domain/management/configuration',bodyParser.raw({
	type:['application/xml','text/xml'],
}),require('./configure.post'));
module.exports = router;
