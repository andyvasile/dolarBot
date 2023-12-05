#!/bin/bash

# Obtener la cotización del dólar blue en formato JSON
blue=$(curl -s https://dolarapi.com/v1/dolares/blue)
mep=$(curl -s https://dolarapi.com/v1/dolares/bolsa)

# Obtener la cotización de venta
venta_blue=$(echo $blue | /opt/homebrew/bin/jq -r '.venta')
venta_mep=$(echo $mep | /opt/homebrew/bin/jq -r '.venta')

# Obtener la fecha y hora en el formato deseado
date_time=$(date +'%d/%m/%y - %H:%M')

# Escribir en los archivos .dat
echo "$date_time - \$$venta_blue" >> /Users/andy/Dropbox/s/dolar_bot/cot_blue.dat
echo "$date_time - \$$venta_mep" >> /Users/andy/Dropbox/s/dolar_bot/cot_mep.dat

# Obtener la hora actual
current_hour=$(date +'%H%M')

# Verificar si es la hora en punto y ejecutar 'say' en ese caso

if [ $current_hour -eq 1100 ]; then
    /usr/bin/afplay /System/Library/Sounds/Blow.aiff >/dev/null 2>&1
    say -v Diego "Las cotizaciones de hoy son $venta_blue para el dolar blue, y $venta_mep para el dolar mep."
fi

if [ $current_hour -eq 1645 ]; then
    /usr/bin/afplay /System/Library/Sounds/Blow.aiff >/dev/null 2>&1
    say -v Diego "Las cotizaciones cerraron en $venta_blue para el dolar blue, y $venta_mep para el dolar mep."
else
    /usr/bin/afplay /System/Library/Sounds/Glass.aiff >/dev/null 2>&1
fi
