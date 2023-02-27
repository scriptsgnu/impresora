# NOMBRE

 impresora - Evita que los inyectores se sequen
 imprimiendo una página cada un intervalo de días
 
# SINOPSIS
  **impresora** [*OPCION*]  
  **impresora** [-a|-b|-c|-d]
  
# DESCRIPCIÓN

  script escrito en bash que sirve para programar la impresión de una 
  hoja en un intervalo de días y horas
  
# OPCIONES

  **-a** [1-7]-[1-23]-[1-23]
  : programa una impresión cada un intervalo de días, a unas horas entre lúnes y viernes.  
  Ejemplo, cada 5 días entre las 12 y las 15  
  ---- > impresora -a 5-12-15
  
  **-b** [1-23]-[1-23]
  : programa un intervalo de horas para los sábados y domingos  
  Ejemplo  
  ---- > impresora -b 14-16
  
  **-c** [IMPRESORA]
  : guarda con qué impresora se imprimirá (para saber el nombre de tu impresora con lpstat -a)  
  Ejemplo  
  ---- > impresora -c EPSON
  
  **-d**
  : muestra los datos del fichero de configuración  
  Ejemplo  
  ---- > impresora -d
  
# MIRAR

  lpstat -a, lpstat -p -d
  
# REPORTAR BUGS A

  github/bugs  

  
# ARCHIVOS

  contador.sh, fiestas.sh, config
  
# AUTOR

  Escrito por scriptsgnulinux  
  https://youtube.com/@scriptsgnulinux
  
# COPYRIGHT

  Boost Software License 1.0
