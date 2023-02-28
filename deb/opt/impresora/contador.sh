#!/bin/bash
source fiestas.sh
expresion () { date +%j | sed -e 's/^0\+//g' > contador; }
FICHERO=contador
impre=`cat config | sed -n '3p'`
if [ "$impre" = "---" ]
then
	sed -i "3 s/^.*$/$(lpstat -a | cut -d ' ' -f1)/g" config
	impre=`lpstat -a | cut -d ' ' -f1`
fi
imprime ()
{
	cupsdisable $impre
	lp -P $1 $2 -d $impre
	cupsenable $impre
}
imprimir () 
{
	aleatorio=$((RANDOM%3))
	echo 'imprimir'
	if [[ $aleatorio -eq 0 ]]
	then
		#descarga la página y la convierte a pdf
		wget https://www.eltiempo.es/valladolid.html
		wkhtmltopdf valladolid.html valladolid.pdf
		imprime 2 "valladolid.pdf"
	else
		wget -O eldiario.html eldiario.es/rss
		wkhtmltopdf eldiario.html eldiario.pdf
		numpag=`sort -r -n -k 2 -t: <((pdfgrep -p "Yolanda" rss.pdf)) | sed -n "1 p" | sed 's/:.*$//g'`
		imprime $numpag "eldiario.pdf"
	fi
	
}
for ((;;))
do
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
	sleep 600
done
