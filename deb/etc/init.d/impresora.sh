#!/bin/bash

if [[ $# -eq 0 ]]
then
	echo "Modo de empleo: /etc/init.d/impresora.sh {start|stop}"
elif [[ $1 = "start" ]]
then
	echo "Iniciando Servicio..."
	cd /opt/impresora
	./contador.sh
else
	echo "Deteniendo Servicio..."
	pkill -f contador.sh
fi





