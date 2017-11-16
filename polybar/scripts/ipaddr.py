#!/usr/bin/python
from urllib.request import urlopen
from xml.etree import ElementTree as ET

url = 'http://freegeoip.net/xml/'

with urlopen(url) as res:
    s = res.read()

root = ET.fromstring(s)

ip = root.find('IP').text
country = root.find('CountryName').text

print('%s (%s)' % (ip, country))
