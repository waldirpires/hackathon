import javax.xml.transform.TransformerFactory
import javax.xml.transform.stream.StreamResult
import javax.xml.transform.stream.StreamSource

// Load xslt
def xslt= new File(args[2]).getText()

// Create transformer
def transformer = TransformerFactory.newInstance().newTransformer(new StreamSource(new StringReader(xslt)))

// Load xml
def xml= new File(args[1]).getText()

// Set output file
def html = new FileOutputStream(args[3])

// Perform transformation
transformer.transform(new StreamSource(new StringReader(xml)), new StreamResult(html))