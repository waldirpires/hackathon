def xml = '''<?xml version="1.0" encoding="UTF-8"?>
<doc version="XSEIF R6"
xmlns="urn:x-ericsson:r2:reg-doc:1551-fad.110.05:en:*">
<body>
<chl><title xml:id="id_pn6k">Resource Identifier</title>
</chl>
</body>
</doc>
'''

def parsedXml = new XmlSlurper().parseText(xml)

def builder = new groovy.xml.StreamingMarkupBuilder()
builder.encoding = 'UTF-8'
def transformedXml = builder.bind {
    mkp.xmlDeclaration() 
    topic(id:"Sample Page") {
        title{
            parsedXml.body.chl.text()
        }        
    }
}

println groovy.xml.XmlUtil.serialize(transformedXml)