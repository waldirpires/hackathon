import xpath
import sys
import lxml.etree as ET

dom = ET.parse(sys.argv[1])

print xpath.find(sys.argv[2], dom)