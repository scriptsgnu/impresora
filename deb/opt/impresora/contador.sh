#!/bin/bash
source fiestas.sh
expresion () { date +%j | sed -e 's/^0\+//g' > contador; }
FICHERO=contador
impre=`cat config | sed -n '3p'`
if [ "$impre" = "---" ]
then
	sleep 100
	sed -i "3 s/^.*$/$(lpstat -a | cut -d ' ' -f1)/g" config
	impre=`lpstat -a | cut -d ' ' -f1`
fi
imprime ()
{
	cupsdisable $impre
	sleep 6
	lp -P $1 $2 -d $impre
	sleep 6
	cupsenable $impre
	sleep 60
	cupsenable $impre
}
imprimir () 
{
	if  curl eldiario.es &>/dev/null && curl eltiempo.es &>/dev/null
	then
		aleatorio=$((RANDOM%3))
		echo 'imprimir'
		if [[ $aleatorio -eq 0 ]]
		then
			#descarga la página y la convierte a pdf
			curl -Lo valladolid.html https://www.eltiempo.es/valladolid.html
			wkhtmltopdf valladolid.html valladolid.pdf
			imprime 2 "valladolid.pdf"
		else
			curl -Lo eldiario.html eldiario.es/rss
			wkhtmltopdf eldiario.html eldiario.pdf
			numpag=`sort -r -n -k 2 -t: <((pdfgrep -p "$(cat config | sed -n '4p')" eldiario.pdf)) | sed -n "1 p" | sed 's/:.*$//g'`
			if [[ $numpag = "" ]]
			then
				numpag=`sort -r -n -k 2 -t: <((pdfgrep -p "a" eldiario.pdf)) | sed -n "1 p" | sed 's/:.*$//g'`
				aleatorio=$((1+RANDOM%$numpag))
				imprime $aleatorio "eldiario.pdf"
			else
				imprime $numpag "eldiario.pdf"
			fi
		fi
	else
		if ping -c1 google.com &>/dev/null
		then
			sed -i "4 s/^.*$/date: `date '+%A %d %B %Y'`/g" conexion.md
			sed -i "8 s/^.*$/Alguna página está caida, eltiempo.es o eldiario.es/g" conexion.md
			pandoc conexion.md -o conexion.pdf
			imprime 1 "conexion.pdf"
		else
			sed -i "4 s/^.*$/date: `date '+%A %d %B %Y'`/g" conexion.md
			sed -i "8 s/^.*$/google está caído o no hay internet/g" conexion.md
			pandoc conexion.md -o conexion.pdf
			imprime 1 "conexion.pdf"
		fi
	fi
}
for ((;;))
do
	sleep 100
	if [ -f $FICHERO ] 
	then
		hora=`date +%H | sed -e 's/^0//g'`
		dia=`date +%j | sed -e 's/^0\+//g'`
		dib=`cat contador`
		dif=$((dia-dib))
		disem=`date +%u`
		lconfig=`sed -n '1p' config`
		IFS='-' read -ra linea <<< "$lconfig"
		if [[ $dif -ge ${linea[0]} ]] && [[ $hora -ge ${linea[1]} ]] && [[ $hora -le ${linea[2]} ]]
		then
			if [[ $disem != 6 ]] && [[ $disem != 7 ]]
			then
				fiesta
				if [[ $contador -eq 0 ]]
				then
					imprimir
				fi
					expresion
			else
				lconfig=`sed -n '2p' config`
				IFS='-' read -ra linea <<< "$lconfig"
				if [[ $hora -ge ${linea[0]} ]] && [[ $hora -le ${linea[1]} ]]
				then
					fiesta
					if [[ $contador -eq 0 ]]
					then
						imprimir
					fi
					expresion
				fi
			fi
		fi
	else
		expresion
	fi
done
