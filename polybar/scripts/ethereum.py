#!/usr/bin/env python3

import requests

try:
    r = requests.get('https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=GBP');
    ticker = r.json()
    print('£%.2f' % float(ticker['GBP']))
except requests.exceptions.RequestException as e:
    sys.exit(1)
