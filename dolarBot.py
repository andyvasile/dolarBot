#!/usr/bin/python
import os
import sys
import csv
import datetime
import time

def dolarBot():

        a = os.popen("/usr/bin/curl http://ws.geeklab.com.ar/dolar/get-dolar-json.php").read()

        lines = a.split('\n')
        ts = time.time()
        date = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')

        cambio = lines[0][10:15]

        # Grabo los datos de manera local para archivo historico

        out_file = open('~/data.csv', 'a')
        writer = csv.writer(out_file)
        writer.writerow((date, " - Dolar Libre: "+cambio))
        out_file.close()
        return

if __name__ == '__main__':
        dolarBot()
