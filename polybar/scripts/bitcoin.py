#!/usr/bin/env python3

import requests

r = requests.get('https://blockchain.info/ticker');
ticker = r.json()

print('£%.2f' % float(ticker['GBP']['sell']))
