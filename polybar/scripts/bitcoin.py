#!/usr/bin/env python3

import requests

try:
    r = requests.get('https://blockchain.info/ticker');
    ticker = r.json()
    print('£%.2f' % float(ticker['GBP']['sell']))
except requests.exceptions.RequestException as e:
    sys.exit(1)
