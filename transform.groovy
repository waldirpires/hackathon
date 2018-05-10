def xml = '''<?xml version="1.0" encoding="UTF-8"?>
<Record>
   <XYZ>
      <Header>
         <Code>12345</Code>
      </Header>
      <Details>
         <RecID>1</RecID>
         <RecordDetail>
            <Name>ABC</Name>
            <Email>abc@in.com</Email>
            <Address>123,acdf</Address>
         </RecordDetail>
      </Details>
      <Details>
         <RecID>2</RecID>
         <RecordDetail>
            <Name>ABC</Name>
            <Email>abc@in.com</Email>
         </RecordDetail>
      </Details>
   </XYZ>
</Record>'''

def parsedXml = new XmlSlurper().parseText(xml)

def builder = new groovy.xml.StreamingMarkupBuilder()
builder.encoding = 'UTF-8'
def transformedXml = builder.bind {
    mkp.xmlDeclaration() 
    Record {
        Header {
            Code (parsedXml.'**'.find{ it.name() == 'Code'})
        }
        def details = parsedXml.'**'.findAll{ it.name() == 'Details'}       
        details.each { detail ->
            Details {
                RecID (detail.RecID)
                detail.RecordDetail.children().each { fld ->
                    RecordDetail { 
                        FieldName (fld.name())
                        FieldValue (fld.text())
                    }
                }
            }
        }
    }
}

println groovy.xml.XmlUtil.serialize(transformedXml)