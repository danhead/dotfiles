#!/usr/bin/python
import subprocess
import re
url = 'google.co.uk'

ps = subprocess.Popen('ping -c 1 %s | tail -1' % url, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
print(re.sub(r'[^0-9.+]', '', str(ps.stdout.read())).split('.')[0])
