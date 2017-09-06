#!/usr/bin/python
import subprocess
import re

ps = subprocess.Popen('ps ax | grep openvpn | grep -v grep | tail -l | rev | cut -d \'/\' -f 1 | rev', shell=True, stdout=subprocess.PIPE)
line = str(ps.stdout.readline())
process = str(ps.stdout.readline())[1:]
status = None
connected = False
if len(process) > 5:
    connection = re.sub(r'[^0-9A-Za-z.]', '', process[1:])
    server = connection.upper().split('.')[0]
    proto = re.sub(r'[^A-Z]', '', connection.upper().split('.')[3])
    status = '%s.%s' % (server, proto)
    connected = True
else:
    status = 'down'

print('VPN: %s' % status)
print('VPN: %s' % status)

if connected:
    print('#00FF00')
else:
    print('#FF0000')
