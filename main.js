
"use strict";

var parser = require ('./alf.js').parser;
var fs = require ('fs');
var file = process.argv[2];
var data = fs.readFileSync(file).toString();
try {
   console.log(JSON.stringify(parser.parse(data, null, 2)));
}
catch (e) {
   console.log (e.message);
}
