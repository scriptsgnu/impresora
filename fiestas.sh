#!/bin/bash
fiesta ()
{
	contador=0
	hoy=`date +%j | sed -e 's/^0\+//g'`
	cadena=''
	fiesta[0]=`date +%j --date="$(date +%Y)-01-02"  | sed -e 's/^0\+//g'`
	fiesta[1]=`date +%j --date="$(date +%Y)-01-06"  | sed -e 's/^0\+//g'`
	fiesta[2]=`date +%j --date="$(date +%Y)-04-06"  | sed -e 's/^0\+//g'`
	fiesta[3]=`date +%j --date="$(date +%Y)-04-07"  | sed -e 's/^0\+//g'`
	fiesta[4]=`date +%j --date="$(date +%Y)-05-01"  | sed -e 's/^0\+//g'`
	fiesta[5]=`date +%j --date="$(date +%Y)-07-25"  | sed -e 's/^0\+//g'`
	fiesta[6]=`date +%j --date="$(date +%Y)-08-15"  | sed -e 's/^0\+//g'`
	fiesta[7]=`date +%j --date="$(date +%Y)-10-12"  | sed -e 's/^0\+//g'`
	fiesta[8]=`date +%j --date="$(date +%Y)-11-01"  | sed -e 's/^0\+//g'`
	fiesta[9]=`date +%j --date="$(date +%Y)-12-06"  | sed -e 's/^0\+//g'`
	fiesta[10]=`date +%j --date="$(date +%Y)-12-08"  | sed -e 's/^0\+//g'`
	fiesta[11]=`date +%j --date="$(date +%Y)-12-25"  | sed -e 's/^0\+//g'`
	fiesta[12]=`date +%j --date="$(date +%Y)-05-13"  | sed -e 's/^0\+//g'`
	fiesta[13]=`date +%j --date="$(date +%Y)-09-08"  | sed -e 's/^0\+//g'`

	for i in "${fiesta[@]}"
	do
			resta=$((i-hoy))
			if [[ $resta -ge 1 ]] && [[ $resta -le 9 ]]
			then
				contador=$((contador+1))
				r=`date +%A --date="+$resta day"`
				d=`date +%d --date="+$resta day"`
				if [[ $contador -eq 1 ]]
				then
				cadena="${r} ${d}"
				fi
				if [[ $contador -eq 2 ]]
				then
				cadena="${cadena} y ${r} ${d}"
				fi
				if [[ $contador -eq 3 ]]
				then
				cadena="${cadena} y ${r} ${d}"
				fi
			fi
	done
	if [[ $contador -gt 0 ]]
	then
		sed -i "4 s/^.*$/date: `date '+%A %d %B %Y'`/g" fiestas.md
		sed -i "8 s/^.*$/Próximo $cadena/g" fiestas.md
		pandoc fiestas.md -o fiestas.pdf
		imprime 1 "fiestas.pdf"
	fi
}

