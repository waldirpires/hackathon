import sys

from elementtree.ElementTree import ElementTree
mydoc = ElementTree(file=sys.argv[1])
for e in mydoc.findall(sys.argv[2]):
    print e.text