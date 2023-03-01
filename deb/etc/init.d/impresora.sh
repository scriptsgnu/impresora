#!/bin/bash

### BEGIN INIT INFO
# Provides: impresora
# Required-Start:    $local_fs $syslog $remote_fs dbus
# Required-Stop:     $local_fs $syslog $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Script para el mantenimiento de los inyectores de la impresora
### END INIT INFO
# 
#
# scriptsgnulinux <scriptsgnulinux@gmail.com>



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





