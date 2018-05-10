import lxml.etree as ET
import sys
import os

if len(sys.argv) < 2:
    print 'usage: python xsl-transform.py <source-xml-file> <xslt-file> [destination-file]'
    sys.exit()

print 'Transforming ' + sys.argv[1] + ' ...'
dom = ET.parse(sys.argv[1])
xslt = ET.parse(sys.argv[2])
transform = ET.XSLT(xslt)
newdom = transform(dom)

str = ET.tostring(newdom, pretty_print=True)

if len(sys.argv) < 4:
  print(str)
else:
  text_file = open(sys.argv[3], "w")
  text_file.write(str)
  text_file.close()
  print os.stat(sys.argv[3]).st_size, ' Bytes'

print
print 'Done!'