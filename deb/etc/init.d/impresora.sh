#!/bin/bash

case "$1" in
start)
echo "Iniciando Servicio..."
./opt/impresora/contador.sh
;;
stop)
echo "Deteniendo Servicio..."
pkill -f contador.sh
;;
*)
echo "Modeo de empleo: /etc/init.d/impresora.sh {start|stop}"
exit 1
;;
esac
exit 0
