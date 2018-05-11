var fs = require('fs');
var xml2js = require('xml2js');

var parseString = xml2js.parseString;
var xml = fs.readFileSync(process.argv[2]);
console.log(xml);

parseString(xml, function (err, result) {
    console.log(JSON.stringify(result));
    
});
