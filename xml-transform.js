xslt = require('node_xslt')

stylesheet = xslt.readXsltString(string);
// readXsltString
// Arguments: string containing XSLT
// Returns: stylesheet object

stylesheet = xslt.readXsltFile(filename);
// readXsltFile
// Arguments: filename to file containing XSLT
// Returns: stylesheet object

document = xslt.readXmlString(string);
// readXmlString
// Arguments: string containing XML
// Returns: document object

document = xslt.readXmlFile(filename);
// readXmlFile
// Arguments: filename to file containing XML
// Returns: document object

htmlDocument = xslt.readHtmlString(string);
// readHtmlString
// Arguments: string containing HTML
// Returns: document object

htmlDocument = xslt.readHtmlFile(string);
// readHtmlFile
// Arguments: filename to file containing HTML
// Returns: document object

transformedString = xslt.transform(stylesheet, document, parameters);
// transform
// Arguments:
//  * stylesheet: stylesheet object
//  * document: document object
//  * parameters: an array of parameters to be passed to the stylesheet. length must be multiple of 2.
//        Example: ['param1Name', 'param1Value', 'param2Name', 'param2Value']