# NOMBRE

 impresora.sh - Evita que los inyectores se sequen
 imprimiendo una página cada un intervalo de días
 
# SINOPSIS
  **impresora.sh** [*OPCION*]  
  **impresora.sh** [*OPCION*]...[ARGUMENTO]
  
# DESCRIPCIÓN

  script escrito en bash que sirve para programar la impresión de una 
  hoja en un intervalo de días y horas
  
# OPCIONES

  **-a** [1-7]-[1-23]-[1-23]
  : programa una impresión cada un intervalo de días, a unas horas entre lúnes y viernes.  
  Ejemplo, cada 5 días entre las 12 y las 15  
  ---- > sudo impresora.sh -a 5-12-15
  
  **-b** [1-23]-[1-23]
  : programa un intervalo de horas para los sábados y domingos  
  Ejemplo  
  ---- > sudo impresora.sh -b 14-16
  
  **-c** [IMPRESORA]
  : guarda con qué impresora se imprimirá (para saber el nombre de tu impresora con lpstat -a)  
  Ejemplo  
  ---- > sudo impresora.sh -c EPSON
  
  **-d**
  : muestra los datos del fichero de configuración  
  Ejemplo  
  ---- > impresora.sh -d
  
  **-e** [TEXTO]
  : guarda que cadena de texto buscará en una página de noticias, si la encuentra la imprimirá, sino otra al azar, pero puede que imprima la página del tiempo por azar o te avise de si es fiesta (debes adaptar fiestas.sh a las de tu provincia)  
  Ejemplo  
  ---- > sudo impresora.sh -e Yolanda
  
  **-h**
  : muestra la ayuda del programa  
  Ejemplo  
  ---- > impresora.sh -h  
  
  **-v**
  : muestra la versión del script  
  Ejemplo  
  ---- > impresora.sh -v  
  
# COMANDOS NECESARIOS

  sudo /etc/init.d/impresora.sh start (inicia el script)  
  sudo /etc/init.d/impresora.sh stop (detiene el script)  
  sudo update-rc.d impresora.sh defaults (crea un link e inicia el script cada vez que arranca el ordenador)  
  sudo update-rc.d -f impresora.sh remove (borra el link y no se inicia el script cada vez que arranca el ordenador)  
  
# MIRAR

  lpstat -a, lpstat -p -d
  
# REPORTAR BUGS A

  scriptsgnulinux@gmail.com 

  
# ESTRUCTURA Y ARCHIVOS DEL PROGRAMA

 deb/  
├── DEBIAN  
│   └── control  
├── etc  
│   └── init.d  
│       └── impresora.sh  
├── opt  
│   └── impresora  
│       ├── config  
│       ├── contador.sh  
│       ├── fiestas.sh  
│       └── readme.1  
└── usr  
    ├── bin  
    │   └── impresora.sh  
    └── local  
        └── share  
            └── man  
                └── impresora.1.gz  
  
# AUTOR

  Escrito por scriptsgnulinux  
  https://youtube.com/@scriptsgnulinux  
  scriptsgnulinux@gmail.com  
  
# VIDEOTUTORIALES DEL SCRIPT

  https://youtube.com/playlist?list=PL4oUZG0zEgsjEaxYCSJNHBeZ3qi_ljKsD  
  
  
# COPYRIGHT

  Boost Software License 1.0
