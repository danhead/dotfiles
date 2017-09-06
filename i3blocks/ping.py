#!/usr/bin/python
import subprocess
import re
url = 'google.co.uk'

ps = subprocess.Popen('ping -c 1 %s | tail -1 | awk \'{print $4}\' | cut -d \'/\' -f 2' % url, shell=True, stdout=subprocess.PIPE)
ping = re.sub(r'[^0-9.]', '', str(ps.stdout.read()))

print('Ping %sms' % ping)
print('Ping %sms' % ping)

if float(ping) > 100:
    print('#FF0000')
elif float(ping) > 50:
    print('#DDDD00')
else:
    print('#00FF00')
