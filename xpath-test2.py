import sys
import xml.etree.ElementTree as ET
root = ET.parse(sys.argv[1])
result = ''
print root
for elem in root.findall(sys.argv[2]):
    # How to make decisions based on attributes even in 2.6:
    print elem