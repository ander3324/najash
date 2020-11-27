#!/bin/bash
## NAJASH no es otra cosa que un conjunto de scripts realizados en bash, los cuales ayudan a realizar un trabajo
## de auditoria o pentesting convencional, ya que son de alguna manera los comandos tipicos que suelo utilizar en
## mis auditorias, los cuales con el tiempo uno empieza a olvidar y tiene que recurrir al man o bibliogiafía de ayuda.
## Por ello con el tiempo se me ocurrió ir escribiéndolos y de a poco ahora los fui concatenando.
## Su nombre viene en homenaje a la primer serpiente mas antigua conocida, se la considera la mas basal.
## La serpiente no alcanzaba más de 1,50 metros de longitud, y vivió durante el cretácico superior 
## (ca. 90 millones de años atrás) en la provincia de Río Negro (de ahí su nombre específico rionegrina) de la Patagonia 
## Argentina. Es el fósil de serpiente mas antiguo conocido, de ahí deriva el antiguo genero Naja utilizados para las cobras.
## Muchos relacionan desde el punto de vista religioso a Najash como el diablo o demonio ya que fue quien tentó a Adan y Eva.
## Personalmente no creo en cuestiones religiosas, las respeto. Como amante de la Biología Herpetológica, y las serpientes y su ciencia, me gustó 
## este nombre.
##
## Este script puedes modificar, copiar, regalar, borrar, incluso instalarlo y hacer lo que quieras, lo que no significa que
## en todos los casos tenga que funcionar o cumplir con tus expectativas. Si algo no funciona bien eres libre de poder modificarlo a
## tu antojo. Si quieres realizarle mejoras y mandarlas para compartirlo con los demás, es siempre bienvenido y puedes enviarlo
## en los datos que dejo abajo.
##
## Nombre: Pedro Matias Cacivio
## E-mail: cacivio@hotmail.com, cacivio@gmail.com
## https://www.facebook.com/cacivio
## Para criticas o si no te gusto envialas a mechupaunhuevo@tuopinion.com
## Menu Principal de Najash 0.2
## Fecha de Origen: 22/01/2010
## Fecha de Modificacion: 11/12/2012
## Última Modificación: 25/11/2020

clear 
MenuPrincipal() {

echo	 "\e[1;31m*******************************************************"
echo    	"*           BIENVENIDO A NAJASH 0.2.1                 *"
echo    	"*              INSTEL & SEGURIDAD                     *"
echo    	"*                 (=SERPIENTE=)                       *"
echo    	"*                                                     *"
echo    	"*******************************************************\e[0m"
echo
echo     	"\e[1;34m0 - Interacción con nmap"
echo     	"1 - Técnicas de Ataques de Escaneo de Red"
echo     	"2 - Vulnerabilidades WEB de un sitio (demora tiempo)"
echo     	"3 - Keylogger"
echo	 	"4 - Auditoría WIFI"
echo	 	"5 - Registros de IP y Hosts  Víctimas"
echo     	"6 - Menú  de Información TCP/UDP y SOCKETS"
echo     	"7 - Herramientas de Seguridad Forense"
echo     	"8 - Recuperar Contraseñas en base a su hash usando HASHCAT"
echo	 	"9 - EXIT\e[0m" 
}
Continuar() {

    read -p "Presione enter para continuar: " xxx

}

## Menú de Nmap
## Acá se escriben script, convencionales con el uso de la herramienta nmap su sitio oficial es http://nmap.org
## Nmap es un programa de código abierto que sirve para efectuar rastreo de puertos, muy utilizado en auditorias
## su creador es Gordon Lyon (Fyodor Vaskovich). Se usa para evaluar la seguridad de sistemas informáticos, 
## así como para descubrir servicios o servidores en una red informática. En su sitio oficial se publican múltiples
## script y se recomienda siempre mirar http://nmap.org/man/es/ para su correcto uso. Hoy en día existe bibliografía
## mas actualizadas en libros publicados por el autor y referentes en Seguridad Informática http://nmap.org/book/
##
Nmap() {

	    MenuNmap() {
clear
echo "\e[1;31m	        -----------------------------------------
     	 	-	VARIANTES MÁS USADAS EN NMAP    -
     	 	-            (=SERPIENTE=)              -
     		- ---------------------------------------\e[0m"

echo "\e[1;34m           
                INGRESA UNA OPCIÓN QUE QUIERAS REALIZAR

     - 0- Salir del Menú Nmap

     - 1- Determina los Servicios en Puertos TCP y Sistema Operativo

     - 2- Chequea las Máquinas Vivas de una red Determinando su MAC e IP

     - 3- Intenta Distintas Formas de Escaneo TCP SYN, ACK o UDP

     - 4- Escaneo ICMP del tipo ECHO, Marca de Fecha, Máscara de red y Sistema Operativo

     - 5- Escaneo Análisis TCP SYN/CONNECT() en Puertos TCP y UDP además de sus Versiones

     - 6- Detección de Servicios por sondeo TCP Null, FIN, y Xmas

     - 7- Realiza un Sondeo de Manera Agresiva en los Puertos que se Especifiquen

     - 8- Realiza un Sondeo de listas o rangos de Host o IP que Determines en un Archivo

     - 9- Sirve para Escanear Usando Maquinas ZOMBIES no Dejando Rastros

     - 10- Sondeo para Expertos, Permite Especificar tus Parámetros flags TCP\e[0m"


}
leyenda="\e[36m
    -------------------------------------------------------------------------------------------------------------------------
     Ingresar el IP o dominio a Analizar. Por ejemplo www.instelseguridad.com.ar. Si queremos analizar distintas IP dentro de un mismo rango, podemos poner 192.168.1.1-254 si queremos analizar 254 IP o 200.45.12.2,112,180,220,242 si dentro de un --rango queremos analizar distintas IP. Si pretendemos analizar grandes rangos, podemos poner 200.45.1.12/24 analizara todas las IP del último bytes (256 IP), 200.45.1.12/16 para analizar los últimos 2 bytes (65565 IP), 200.45.0.0-200.45.255.255                                                             -
    -----------------------------------------------------------------------------------------------------------------------\e[0m"

sond=1
while  [ $sond -gt 0 ]
do
    MenuNmap

read -p "Ingrese el Sondeo que Quiera Realizar: " sond

case $sond in
    0)
	clear
	echo " \e[36mVolviendo al Panel Principal de NAJASH\e[0m"
	echo;;

    1)
	clear
	echo $leyenda
	read -p "Ingresar la IP o Dominio: " host
	clear
	nmap -A -T4 $host
	Continuar;;

    2)
	clear
	read -p "Ingresar la Red que Quieras Analizar. Por ejemplo: 192.168.1.1: " red
	clear
	nmap -sP $red/24
	Continuar;;
    3)
	clear
	echo $leyenda
	read -p "Ingresar la IP o Dominio que Deseas Analizar: " dom
	clear
	nmap -PS -PA -PU $dom
	Continuar;;

    4)
	clear
	echo $leyenda
	read -p "Ingresar la IP o Dominio que Deseas Analizar: " dom1
	clear
	nmap -PE -PP -A -PM $dom1
	Continuar;;

    5)
	clear
	echo $leyenda
	read -p "Ingresar la IP o Dominio que Deseas Analizar: " dom2
	clear
	nmap -sS -sU -sV $dom2
	Continuar;;

    6)
    clear
    echo 
    echo        "\e[1;34ma- Sondeo Null, No fija ningun bit (La cabecera de Banderas TCP es 0)"
    echo        "b- Sondeo FIN (Solo fija el bit TCP FIN)"
    echo        "c- Sondeo Xmas (Fija los bits de FIN, PSH y URG flags)\e[0m"
    echo 
    echo 
	read -p "Ingrese el Parametro a Utilizar:" opt

case $opt in

	"a")  read -p "Ingresar la IP o Dominio que Deseas Analizar:" vict
	    nmap sN $vict;;

	"b")  read -p "Ingresar la IP o Dominio que Deseas Analizar:" vict
	    nmap sF $vict;;

	"c")  read -p "Ingresar la IP o Dominio que Deseas Analizar:" vict
	    nmap sX $vict;;
esac
Continuar;;

    7)
	clear
	read -p "Ingresar la IP o Dominio que Deseas Analizar:" vict2
	read -p "Ingrese los Puertos que Desea Analizar por ejemplo 21,23,80,135,445:" port
	clear
	nmap -PO -sS -O -p $port -T Aggressive $vict2
	Continuar;;
    8)
	clear
	read -p "Ingrese el Nombre de la Lista, ésta debe estar en el Directorio donde Corremos Najash:" list
	clear
	nmap -iL $list
	Continuar;;

    9)
	clear
	read -p "Ingrese el IP o Host Zombie:" zom
	read -p "Ingrese el IP o Host de la Víctima:" vict3
	clear
	nmap -Pn -p- -sI $zom $vict3
	Continuar;;

    10)
	clear
	read -p "Ingresar el IP o Host a Analizar:" vict4
	read -p "Ingresa los Parámetros URG, ACK, PSH, RST, SYN, y FIN por ejemplo URGACKPSH fija las 3 banderas:" band 
	clear
	nmap --scanflags $band $vict4
	Continuar;;

esac
done
}

##
## En el menú de Soofing que sera cargado en memoria para ser ejecutado cuando se requiera
## Spoofing pertenece a la opción 1 del MenuPrincipal
## Por lo general encontraremos técnicas de Man on the middle en la que podremos interceptar comunicaciones
## con distintas finalidades, como captura de contraseñas, envenenamientos de tablas ARP para poder redireccionar
## y capturar el trafico circundante en una red LAN.
## Denegar servicios totales o específicos, redireccion del trafico de dominios determinados entre otras tantas 
## cosas. Se requiere un conocimiento mínimo así como también que el hardware soporte los programas instalados y 
## sobre todo una placa de red que soporte el modo monitor o promiscuo 
##
##


#Spoofing() {
 #       MenuSpoofing(){
#    clear
#    echo "******************************************"
#   echo "*  BIEN VENIDOS AL MENU DE HERRAMIENTAS  *"
#   echo "*              SPOOFING                  *"              
#   echo "******************************************"
#   echo  
#   echo "0 - Salir del Panel Spoofing"
#   echo "1 - Para TCPKill"
#   echo "2 - Para DoS"
#   echo "3 - Capturar Contraseñas por Man in the middle"
#   echo "4 - Sniffer MSN"
#   echo "5 - Captura Mails"
#   echo "6 - WebSpy"
#   echo "7 - DnsSoopf"
#   echo "8 - TCPNice"
#}
#echo 1 > /proc/sys/net/ipv4/ip_forward
#SPOO=1
#while  [ $SPOO -gt 0 ]
#do

#   MenuSpoofing

#        read -p " Ingresa tu Opcion: " SPOO

#        case $SPOO in

#0) echo " Volviendo al Panel Anterior" 
#   clear
#   ;;

#1)
##
## En este submenu podras bloquear puertos o el ingreso a un dominio dentro de la LAN.
##
#    clear
#    echo "    ---------------------------------
#     -                               -
#     - Menu Principal TCPKill        -
#     -                               -
#    - Elegi las opciones            -
#     -                               -
#     - A - Para bloquear puertos     -
#     -                               -
#     - B - Para Bloquear paginas web -
#     -                               -
#     ---------------------------------"

#read -p " Ingresa la Opcion: " opt
#case $opt in
#    "A")
#       read -p " Ingresa la interfaz de tu adaptador de red: " adp
#       read -p " Ingresa el puerto que deseas bloquear: " po
#       tcpkill -i $adp -9 port $po;;
#    "B")
#      read -p " Ingresa numero de IP de la victima: " ip
#       read -p " Ingresa la interfaz de tu adaptador de red: " adp
#       tcpkill -i $adp -9 host $ip;;
#      esac
#      Continuar;;
#2)
#   clear
#  read -p " IP del Getway/Router: " ip
#   read -p " Ingresa el nombre de tu adaptdor de red: " v
#   macof -i $v -d $ip
#   Continuar;;
#3)
#   clear
#   sysctl -w net.ipv4.ip_forward=1
#   cat /proc/sys/net/ipv4/ip_forward
#   iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
#
#   read -p " Ingresa el nombre que le asignara al log de captura de red: " a
#   read -p "Ingrese la interfaz de red (por ejemplo wlan0 o eth0):" wlan
#   read -p "Ingrese la IP de la victima a sniffear:" ipv
#  read -p "Ingrese la IP del Router que se encuentra como gateway:" ipr
#   sslstrip -w $a - l 8080
#   arpspoof -i $wlan -t $ipv $ipr
#   Continuar;;
#4)
#   clear
#   read -p " Ingresa el nombre de tu adaptdor de red: " v
#  msgsnarf -i $v
#   Continuar;;
#5)
#   clear
#  read -p " Ingresa el nombre de tu adaptdor de red: " v
#   mailsnarf -i $v
#   Continuar;;
#6)
#   clear
#   read -p " IP de la victima: " ip
#   read -p " Ingresa el nombre de tu adaptdor de red: " v
#   webspy -i $v $ip
#   Continuar;;
#7)
#   clear
#   read -p " Ingresa el nombre de tu adaptdor de red: " v
#   read -p " Ingresa la ubicacion donde esta tu lista de HOST: " h
#   dnsspoof -i $v -f $h
#   Continuar;;
#8)
#   clear
#   read -p " Ingresa el nombre de tu adaptdor de red: " v
#   read -p " Ingresa el ip del router: " ipr
#   read -p " Ingresa el puerto que deseas bloquear: " po
#   tcpnice -i $v net $ipr or port $po
#   Continuar;;

# esac

#done
#}
ScanRed() {
           MenuScanRed(){
    clear
    echo "\e[1;31m******************************************"
   echo "*  BIENVENIDOS AL MENÚ DE HERRAMIENTAS   *"
   echo "*            ESCANER DE RED              *"
   echo "*          ANGRYIP y NBTSCAN             *"              
   echo "******************************************\e[0m"
   echo  
   echo "\e[1;34m0 - Salir del Panel ScanRed"
   echo "1 - Ejecutar AngryIP en Forma Gráfica"
   echo "2 - Escanear un Equipo con NBTSCAN"
   echo "3 - Escanea un Bloque /24"
   echo "4 - Escanea un Rango por Ejemplo: 192.168.0.1-200"
   echo "5 - Escanea Lista de IP Generada Previamente por Ejemplo: /t00ls/list\e[0m"
}
SCANR=1
while  [ $SCANR -gt 0 ]
do
	MenuScanRed

        read -p " Ingresa tu Opción: " SCANR

        case $SCANR in

0) echo " \e[1;36mVolviendo al Panel Anterior\e[0m" 
   clear
   echo;;
1)
   clear
   ipscan
   Continuar;;
2)
   clear
   read -p " IP a Escanear: " ip
   nbtscan -vs $ip
   Continuar;;
3)
   clear
   read -p " Ingrese IP del Bloque /24 a Escanear: " ipb
   nbtscan $ipb/24
   Continuar;;
4)
   clear
   read -p " Ingrese IP con el Rango a Escanear: " ipr
   nbtscan $ipr
   Continuar;;
5)
   clear
   read -p " Ingrese la Ubicación de la lista: " list
   nbtscan -f $list 
   Continuar;;
 esac

done
}
## Acá pondremos el módulo Seguridad Web
## Podremos realizar testeos con herramientas típicas de consola como ser NIKTO, SQLMAP, ASPAU-DIT, XSSer
## las cuales son herramientas indispensables a la hora de realizar realiza un pentest.
##
## asp-audit= herramienta de auditorias para sitios asp, si bien las fallas no son muy actuales, pero pueden 
## mejorarse en su código de búsqueda y transformarla en un arma indispensable para una auditoria web. 
## Pueden bajar esta herramienta de su sitio en Internet http://
##
## Nikto= una de las mejores herramientas de auditorias de consola para sitios WEB. Si bien la auditoria es moderada 
## ya que por default solo testea el puerto 80 y el 443, el mismo cuenta con un código muy legible en perl, con una 
## una excelente herramienta de consola que podemos obtenerla de http://www.cirt.net/nikto2
## 
##
##
##


clear
SeguridadWeb() {
              MenuWeb(){
clear
     echo "\e[1;31m***********************************************"
     echo "*      TEST DE VULNERABILIDADES WEB           *"
     echo "*                                             *"
     echo "***********************************************\e[0m"
     echo
     echo   "\e[1;34m0 - Salir del Panel Vulnerabilidades Web"
     echo   "1 - Auditoria WordPress"
     echo   "2 - Auditoria http y https NIKTO"
     echo   "3 - Auditoria XSS (Cross Site Scripter) NO ANDA"
     echo   "4 - Auditoria Sitio con MySQL por Ejemplo: http://sitio.com/page.php?id=6"
     echo   "5 - Archery - Vulnerability Assessment and Management Tool\e[0m"
     echo     
     
}

SWEB=1
while [ $SWEB -gt 0 ]
do
     MenuWeb

     read -p " Ingresa tu Opción: " SWEB

     case $SWEB in

 0)
    clear
    echo "\e[1;36m Volviendo al Panel Principal\e[0m"
    echo;;
 1)
    clear
    read -p "Ingrese la Página a Auditar con WordPress, por ejemplo: (http://www.paginaWordPress.com/):" PagWp
    wpscan --url $PagWp --enumerate vp
    Continuar;;

 2)
    clear
    read -p " Ingrese la Web a Auditar, por ejemplo (www.hotmail.com): " host
    echo
    echo "\e[1;36mEsto Puede Demorar Varios Minutos\e[0m"
    sleep 2;
    cd nikto/program
    # ver si se puede usar un clear acá abajo
    ./nikto.pl -h  $host
    Continuar;;
 3)
    clear
    read -p " Ingrese la Web a Auditar con XSS: " Axss
    python XSSer.py -u $Axss --auto --Cem "Hex,Str,Hex" --user-agent "XSSer!!" --timeout "20" --threads "5"       
    Continuar;;
 4)
    clear
    echo "\e[1;36mSe Actualizará sqlmap\e[0m"
    sleep 2;
    sqlmap --update
    read -p "Ingrese el sitio con base de datos MySQL: " Smysql
    sqlmap -u $Smysql 
    Continuar;;
 5)
    clear
    echo "\e[1;36mSe Accederá a la carpeta /archerysec"
    echo "Se Ejecuto Archery Scanner ./run.sh dentro de t00ls/archerysec"
    echo "En un navegador teclear http://localhost:8000/"
    echo "Para Salir Completamente Ejecutar CTRL + C\e[0m"
    cd archerysec
    pwd
    sleep 2;
    sh run.sh 
    Continuar;;
 esac
done
}


## Aca tendremos el codigo del menu principal del keyloguer

        Keyloguer(){
        MenuKeyloguer(){
clear
     echo
     echo "\e[1;31m***********************************************"
     echo "*                 KEYLOGGER                   *"
     echo "*                                             *"
     echo "***********************************************\e[0m"
     echo
     echo   "\e[1;34m0 - Salir del Panel KEYLOGGER"
     echo   "1 - Activando Keylogger"
     echo   "2 - Lectura de Log"
     echo   "3 - Suspender Keylogger"
     echo   "4 - Borrar los Logueos 'logkeys.log'\e[0m"
     echo
     echo
}

KEY=1
while [ $KEY -gt 0 ]
do
     MenuKeyloguer

     read -p " Ingresa tu Opción: " KEY

     case $KEY in

 0)
    clear
    echo "\e[1;36mVolviendo al Panel Principal\e[0m"
    echo;;
 1)
    echo "\e[1;36mCreando Carpeta Contenedora\e[0m"
    rm /var/log/logkeys.log
    touch /var/log/logkeys.log
    sleep 1;
    echo "\e[1;36mLos Archivos de log se encontraran en /var/log/logkeys.log \e[0m" 
    sleep 2;
    echo "\e[1;36mEjecutando Keylogger\e[0m"
    logkeys --start --keymap logkeys/keymaps/es_ES.map
    echo "\e[1;36mKeylogger en Funcionamiento\e[0m"
    sleep 3;
    Continuar;;
 2) 
    clear
    cat /var/log/logkeys.log
    echo "\e[1;36mFIN DEL LOG\e[0m"
    Continuar;;
    
 3) 
    # ver el comando "llkk"
    logkeys --kill
    clear
    echo "\e[1;36mEl Keylogger se Detuvo Correctamente\e[0m"
    sleep 2;
    Continuar;;
    
 4)
    #llkk
    rm -r /var/log/logkeys.log
    clear
    echo "\e[1;36mEl Archivo de log se Borró Correctamente\e[0m"
    sleep 1;
    Continuar;;    
    esac
    done
}     





# CON ESTE CÓDIGO VEÍA LAS COORDENADAS SATELITALES DE LAS MAC DE LOS ROUTER WIFI, AHORA NO ANDA GRACIAS A GOOGLE
#"3")
#    clear
#    rm -r MacRouter
#    echo Creando un Archivo Contenedor
#    mkdir MacRouter
#    sleep 5
#    echo Pocisionandonos en MacRouter
#    sleep 2
#    cd MacRouter
#    pwd
#    read -p " Ingrese la MAC del Router que quiere rastrear: " Mroute
#    wget http://samy.pl/mapxss/?mac=$Mroute
#    clear
#    echo Espere unos Segundos la Informacion se esta Procesando
#    sleep 5
#    echo
#    echo Las Cordenadas del Router Wifi son:
#    echo _______________________________________________________________________________________________________________________________
#    echo
#    grep -a  country index*
#    echo
#    echo ______________________________________________________________________________________________________________________________
#    echo
#     ;;


SeguridadWifi() {
              MenuWifi(){
     echo "\e[1;31m**********************************************"
     echo "*  TEST DE VULNERABILIDADES WIFI (WIFITE)    *"
     echo "*                                            *"
     echo "**********************************************\e[0m"
     echo
     echo   "\e[1;34m0 - Saliendo del Panel Vulnerabilidades Wifi"
     echo   "1 - Ejecutar WIFITE en Forma Convencional"
     echo   "2 - Auditoria WEP"
     echo   "3 - Auditoria WPA y WPA2"
     echo   "4 - Auditoria WPS\e[0m"
     echo
}
leyenda="\e[36m
    -----------------------------------------------------------------------------------------------------------------------
    - IMPORTANTE: Recuerde que cada vez que ejecuta este tipo de ataque su placa de red wifi queda en modo MONITOR o modo PROMISCUO y obviamente no se puede estar conectado a su router WIFI. Para volver la Placa a su modo normal se debe ejecutar 'airmon-ng stop PlacaModoMonitor'. Si quiere saber cual que nombre se le asigno al dispositivo use el comando'ifconfig'                                                                             ------------------------------------------------------------------------------------------------------------------------\e[0m"

SWIFI=1
while [ $SWIFI -gt 0 ]
do
     MenuWifi

     read -p " Ingresa tu Opción: " SWIFI

     case $SWIFI in

 0)
    clear
    echo " \e[1;36mVolviendo al Panel Principal\e[0m"
    echo;;
 1)
    echo "\e[1;36mSe ejecutara WIFITE de Forma Convencional\e[0m"
    echo "Podremos Analizar Distintas Redes WIFI para Analizar su Vulnerabilidad"
    echo "Si no sabes como realizarlo puedes ver un ejemplo en: (https://www.youtube.com/watch?v=kpVeQMSgB7w&ab_channel=SERPIENTEGNU-LINUX)"
    echo "Wifite se ejecutara en 10 Segundos\e[0m"
    echo $leyenda;
    sleep 10; 
    wifite
    Continuar;;

 2)
    echo "\e[1;36mSe auditaran redes con autenticación WEP y potencia igual o superior a 10db" 
    echo "Usamos estos parámetros para poder realizar una buena inyección de paquetes"
    echo "Pudiendo garantizar un nivel de éxito aceptable en pocos minutos\e[0m"
    echo $leyenda;
    sleep 10; 
    wifite -wep -p 10 
    Continuar;;

 3)
    echo "\e[1;36mSe auditaran redes con autenticación WPA y WPA2" 
    echo "Quien audita debe saber que los HANDSHAKE no son fáciles de crackear pudiendo"
    echo "durar días, semanas o meses y dependerá del diccionario que se use\e[0m"
    echo $leyenda;
    sleep 10; 
    read -p "Ingrese la dirección del diccionario (ejemplo: /home/usuario/diccionario.txt): " dic
    wifite -wpa
    wifite -wpa --dict $dic
    Continuar;; 
    
 4)
    echo "\e[1;36mSe auditaran redes con autenticación WPS" 
    echo "Quien audita debe saber que puede demorar varias horas en obtener la passwd"
    echo "mucho dependerá de la distancia en la que se encuentre el router a\e[0m"
    echo $leyenda;
    sleep 10; 
    read -p "Ingrese la dirección donde del diccionario (ejemplo: /home/usuario/diccionario.txt): " dic
    wifite -wps
    wifite -wps --dict $dic
    Continuar;;     
    esac
done
}


## 
## El comando Whois nos sirve para saber sobre la entidad registrante de un dominio o una IP. Este entrega información
## muy valiosa a la hora de una auditoria, sobre todo forense donde muchas veces necesitamos pedir información a un ISP
## sobre determinada IP o dominio.
## También encontraremos información adicional que usado de la manera correcta puede servir de mucho como los DNS, 
## tiempo de expiracion de registros, empresas y entidades, etc.
## Nunca dejes de leer el RFC 3912 y el man. 
##

## El comando DIG (domain information groper) se utiliza también, para obtener información  de un sistema de servidores 
## de nombres. Este comando posee dos modos: modo interactivo simple (para una sola pregunta) y modo de procesamiento 
## (batchmode) el cual realiza una consulta por cada línea  de una lista de preguntas.
##
SeguridadRegistros() {
              MenuRegistros(){
     clear
     echo "\e[1;31m**********************************************"
     echo "*    REGISTROS SOBRE IP Y HOSTS VICTIMAS     *"
     echo "*                                            *"
     echo "**********************************************\e[0m"
     echo
     echo   "\e[1;34m0 - Salir del Panel Registros"
     echo   "1 - Usando el Comando 'whois'"
     echo   "2 - Interactuando con 'dig'"
     echo   "3 - Dominios en DNS"
     echo   "4 - Consultar si una IP Pública, Consultó a un DNS"
     echo   "5 - NSLOOKUP"
     echo   "6 - Reverse DNS\e[0m"
     echo   
     echo
}

SREG=1
while [ $SREG -gt 0 ]
do
     MenuRegistros

     read -p " Ingresa tu Opción: " SREG

     case $SREG in

 0)
    clear
    echo " \e[1;36mVolviendo al Panel Principal\e[0m"
    echo;;
 1)
    echo 
    echo  "\e[1;36mA - Realizar Consulta 'whois'"
    echo  "B - Realizar Consulta 'whois' en Sitios Especificos\e[0m"
    echo
    
    read -p "Ingresa la Opcion: " opc
    case $opc in
    
    "A")
        clear
	echo "\e[1;36mSiempre es mejor usar el comando 'whois' desde el shell\e[0m"
	echo "\e[1;36mCon sus múltiples variantes según lo que queramos investigar\e[0m"
	echo
	read -p "Ingrese la IP que quiere investigar: " ipinv
        whois $ipinv
	Continuar;;

    "B")
       clear
       echo  " \e[1;36mAcá podremos hacer consulta más específica usando demonios\e[0m"
       echo  "\e[1;36m como ser 'whois.arin.net', 'whois.internic.net' o lo que quieras\e[0m"
       echo
       read -p "Ingresa la Empresa, Sitio o Dominio a Investigar por ejemplo: Arnet: " hinv 
       read -p "Ingresa el Host donde lo quieres investigar por ejemplo: whois.arin.net: " hainv
       whois $hinv -h $hainv
       esac
       Continuar;;
              
 2)
        clear
	echo "\e[1;36mRealizaremos consultas con 'dig' \e[0m" 
	echo
	read -p "Ingrese la IP o el Dominio a Investigar: " digi
	dig $digi
        Continuar;;
 3)
        clear
	echo "\e[1;36mSe Investigara un Dominio o IP en Base a su DNS\e[0m"
	echo
	read -p "Ingrese la IP o Dominio a Investigar: " ddom
	read -p "Ingrese el DNS Donde se Consultara: " dnsd
	dig @$ddom $dnsd query-type  query-class
	Continuar;;
 4)
        clear
	echo "\e[1;36mSe Investigara Consultas de una IP en Base a un DNS\e[0m"
	echo
	read -p "Ingrese la IP Pública a Investigar: " ipinv
	read -p "Ingrese el DNS Donde se Consultara: " dnsd
	dig @$ipinv $dnsd A +norecurse
	Continuar;;
  
 5)
   	clear
   	echo "\e[1;36mRealizaremos Consultas con NSLOOKUP"
   	echo "En caso que quieras trabajar en consola en modo interactivo"
   	echo "solo debes ejecutar nslookup y luego poner la IP del DNS a"
   	echo "consultar y luego el dominio a investigar con parámetros como"
   	echo "set type=soa, set type=mx, set type=ns, set type=cname, set type=a\e[0m"
   	read -p "Ingrese el DNS donde Consultar: " dns
  	read -p "Ingrese el Dominio a investigar: " domi
   	nslookup -$domi $dns
   	Continuar;;
 6)
        clear
	echo "\e[1;36mSe Intentará Realizar una Transferencia de Zona"
        echo      "Esto no se logra en todos los casos"
        echo  "En este caso usaremos Fuerza Bruta y puede demorar\e[0m"
	echo
	read -p "Ingrese el Dominio a Investigar: " doinv
	dnsenum $doinv 
        Continuar;;
   
    esac
done
}
SeguridadTCP() {
              MenuTCP(){
     clear
     echo "\e[1;31m**********************************************"
     echo "*   MENU  DE INFORMACIÓN TCP/UDP y SOCKETS   *"
     echo "*                                            *"
     echo "**********************************************\e[0m"
     echo
     echo   "\e[1;34m0 - Saliendo del Panel Registros"
     echo   "1 - Mostrar Todos los Sockects en Escucha"
     echo   "2 - Mostrar Conexiones Específicas Establecidas"
     echo   "3 - Conexiones de Paquetes TCP IPv4"
     echo   "4 - Mostrar todas las conexiones, por un puerto Específico. Ejemplo: https o 443"
     echo   "5 - Mostrar el Número y el Tipo de Conexiones Activas"
     echo   "6 - Resumen del Estado de los SOCKETS"
     echo   "7 - Listar de Puertos en Escucha y PID de los Programas\e[0m"
     echo
}

STCP=1
while [ $STCP -gt 0 ]
do
     MenuTCP

     read -p " Ingresa tu Opción: " STCP

     case $STCP in

 0)
    clear
    echo " \e[1;36mVolviendo al Panel Principal\e[0m"
    echo;;
 1) 
    clear 
    echo "\e[1;36mTodas las Conexiones Establecidas\e[0m"
    ss -l
    Continuar;;
  
 2)
    clear
    echo "\e[1;36mEstablecer Sobre qué Conexión Queremos Saber por ejemplo:\e[0m" "\e[1;33mssh, http, https, ftp, smtp, pop, etc \e[0m"
    read -p "Ingrese la Conexión a Investigar: " ConInv
    ss -o state stablished "'( dport = :$ConInv or sport = :$ConInv)' "
    echo
    Continuar;;
 3)
    clear
    echo "\e[1;34mFiltros: Siguientes Valores:\e[0m"
    echo "\e[1;33m	   established"
    echo "	   syn-sent"
    echo "	   syn-recv"
    echo "	   fin-wait-1"
    echo "	   fin-wait-2"
    echo "	   time-wait"
    echo "	   closed"
    echo "	   close-wait"
    echo "	   last-ack"
    echo "	   listen"
    echo "	   closing"
    echo "         synchronized"
    echo "	   all : Todos los estados de arriba"
    echo "	   connected : Todos los estados salvo listen y closed"
    echo "	   bucket : Mostrar estados mantenidos como minisockets, como time-wait and syn-recv."
    echo "	   big : Lo contrario al estado bucket \e[0m"
    read -p "Ingrese la Conexión a Investigar: " filtro
    clear
    ss -4 state $filtro 
    echo
    Continuar;;
 4) 
    clear 
    echo "\e[1;36mEspecificar Puerto para ver Conexiones Establecidas\e[0m"
    read -p "Ingrese el Puerto o Protocolo a Saber: " Prot
    ss dst *:$Prot
    Continuar;;
 5) 
    clear 
    echo "\e[1;36mTodas las Conexiones Establecidas\e[0m"
    ss -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c
    Continuar;;
 6) 
    clear 
    echo "\e[1;36mTodas las Conexiones Establecidas\e[0m"
    ss -s
    Continuar;;
 7) 
    clear 
    echo "\e[1;36mTodas las Conexiones Establecidas\e[0m"
    ss -tlnp
    Continuar;;
    esac
done
}
##
##
# Aquí veremos módulos de herramientas Forense
# Personalmente pienso que hay que manejar bien su uso para poder auditar sin problemas.
# Se tendrá que tener en cuenta la carpeta donde se ejecutaran los comandos.
## 
## 


SeguridadForense() {
              MenuForense(){
     clear
     echo "\e[1;31m**********************************************"
     echo "*         MENU DE SEGURIDAD FORENSE          *"
     echo "*                                            *"
     echo "**********************************************\e[0m"
     echo
     echo   "\e[1;34m0 - Saliendo del Panel Forense"
     echo   "1 - Obtener HASH MD5 SHA256 y SHA512 los Archivos Deben estar en la Carpeta t00ls/Hash1"
     echo   "2 - Obtener Metadatos de Archivos, estos deben estar en t00ls/MetaData"
     echo   "3 - Borrar Metadatos de Archivos, estos deben estar en t00ls/MetaDataBorrar"
     echo   "4 - Clonar una Imagen Binaria Desde una Fuente a un Destino Calculando su Hash SHA512"
     echo   "5 - Análisis de Redes Wifi con KISMET"
     echo   "6 - Captura TCP en la Conexión Activa"
     echo   "7 - Captura TCP en un Puerto y Dispositivo de Red\e[0m"
     echo   
     echo
}

SFOR=1
while [ $SFOR -gt 0 ]
do
     MenuForense

     read -p " Ingresa tu Opción: " SFOR

     case $SFOR in

 0)
    clear
    echo "\e[1;36m Volviendo al Panel Principal\e[0m"
    echo;;
 1) 
    clear
    echo
    ls Hash1 || mkdir Hash1
    echo  
    echo "\e[1;36mArchivos Alojados en t00ls/Hash1 previamente\e[0m"
    cd Hash1
    read -p "Ingrese la Extención de los Archivos a Peritar, Ejemplo png, jpg doc, etc: " hash1
    clear
    echo
    echo "\e[37m--------------- "
    echo "|  HASH MD5   |"
    echo "--------------- \e[0m"
    echo
    md5sum *.$hash1 
    echo
    echo "\e[37m-----------------"
    echo "|  HASH SHA256  |"
    echo "-----------------\e[0m"
    echo
    sha256sum *.$hash1 
    echo
    echo "\e[37m----------------- "
    echo "|  HASH SHA512  |"
    echo "----------------- \e[0m"
    echo
    sha512sum *.$hash1
    cd ..
    echo "\e[1;36mNos Encontramos en: \e[0m"
    pwd
    Continuar;;
2)
    clear
    echo
    ls MetaData || mkdir MetaData
    echo  
    echo "\e[1;36mArchivos Alojados en t00ls/MetaData previamente\e[0m"
    cd MetaData
    read -p "Ingrese la Extención de los Archivos a Peritar, Ejemplo png, jpg doc, etc: " MetaD
    exiftool *.$MetaD
    echo
    cd ..
    echo "\e[1;36mNos Encontramos en: \e[0m"
    pwd
    Continuar;;
3)
    clear
    echo
    ls MetaDataBorrar || mkdir MetaDataBorrar
    echo  
    echo "\e[1;36mArchivos Alojados en t00ls/MetaDataBorrar previamente\e[0m"
    cd MetaDataBorrar
    read -p "Ingrese la Extención de los Archivos a Peritar, Ejemplo png, jpg doc, etc: " MetaDB
    exiftool -all= *.$MetaDB
    echo
    cd ..
    echo "\e[1;36mNos Encontramos en: \e[0m"
    pwd
    Continuar;;
4)
    clear
    echo  
    echo "\e[1;37mSI NO SABE QUE HACE ESTA HERRAMIENTA NO LE SUJERIMOS USARLA"
    echo "SI COMETE UN ERROR PUEDE PERDER INFORMACIÓN DE SU DISCO\e[0m"
    read -p "Ingrese la Hubicación de la Imagen Binaria, Ejemplo /home/user/datos : " ifImagen
    read -p "Ingrese la Hubicación Destino y Nombre del Archivo: " ofImagen
    dc3dd if=$ifImagen of=$ofImagen hash=sha512 
    echo
    echo "\e[1;36mNos Encontramos en: \e[0m"
    pwd
    Continuar;;
5)
    clear
    echo  
    kismet 
    echo
    Continuar;;
6)
    clear
    echo
    rm -r ReportTCP
    mkdir ReportTCP
    echo
    echo "\e[1;37mLEER IMPORTANTE"
    echo "El Logueo de las Capturas estan en ReportTCP/report.xml"
    echo "Pueden Editarlos con cat ReportTCP/report.xml"
    echo "Pueden Listarlo con ls -l ReportTCP/"
    echo "Para Terminar la Captura Apretar CTRL + C\e[0m"
    echo
    tcpflow -o ReportTCP
    Continuar;;
7)
    clear
    echo
    rm -r ReportTCP
    mkdir ReportTCP
    read -p "Ingrese el Puerto a Escuchar: " port
    read -p "Ingrese la Placa de Red Activa: " pred
    echo
    echo "\e[1;37mLEER IMPORTANTE"
    echo "El Logueo de las Capturas estan en ReportTCP/report.xml"
    echo "Pueden Editarlos con cat ReportTCP/report.xml"
    echo "Pueden Listarlo con ls -l ReportTCP/"
    echo "Para Terminar la Captura Apretar CTRL + C\e[0m"
    echo
    tcpflow -i $pred port $port -o ReportTCP
    Continuar;;
    esac
done
}

##
# La familia de software hashcat es un conjunto de herramientas profesionales sin cargo para la
# comunidad. Hashcat está destinado a ser usado LEGALMENTE como una herramienta para
# recuperar cadenas de texto plano para una variedad de métodos de cifrado tales como

# Acá tenemos el log para ejecutar HASHCAT

clear
Hashcat() {
              MenuHashcat(){
     echo "\e[1;31m***********************************************"
     echo "*      RECUPERADOR DE CONTRASEÑAS POR HASH    *"
     echo "*                USANDO HASHCAT               *"
     echo "***********************************************\e[0m"
     echo
     echo   "\e[1;34m0 - Salir del Panel"
     echo   "1 - Ataque Directo Usando Diccionario"
     echo   "2 - Ataque Directo Convinando las Palabras del Diccionario Dado"
     echo   "3 - Ataque Directo Cambia todas las Letras Minúsculas a Mayúsculas y Viceversa"
     echo   "4 - Ataque Directo con Permutation – Toma las Letras de una Palabra y las Reordena."
     echo   "5 - Ataque Directo Usando una Regla de Tablas Como sustituir las Vocales por Numeros.\e[0m"
     echo
}

HCAT=1
while [ $HCAT -gt 0 ]
do
     MenuHashcat

     read -p " Ingresa tu Opción: " HCAT

     case $HCAT in

 0)
    clear
    echo " \e[1;36mVolviendo al Panel Principal\e[0m"
    echo;;
 1)
    clear
echo "\e[36m Para este ataque debe contar con un diccionario al cual recomendamos ponerlo en un directorio accesible por el usuario"
echo " Si cuenta con muchos hash a analizar es conveniente ponerlos en el mismo directorio. El tiempo dependera del tipo de"
echo " contraseña así como del diccionario usado para la misma, si la palabra no se encuentra, el hash no podrá ser recuperado"
echo
echo " TIPOS DE HASH, INGRESE EL NUMERO QUE CORRESPONDA, POR EJEMPLO PARA MD5 INGRESE EL 0 \e[0m"
### esto deveria ser llamado por un cat
echo "\e[1;37m
 TIPO DE HASH                                          NUMERO CORRESPONDIENTES

  MD5                                                    0, 10, 20
  HMAC-MD5                                               50, 60
  SHA1                                                   100, 110, 120
  HMAC-SHA1                                              150, 160 
  MySQL                                                  200
  MySQL4.1/MySQL5                                        300
  phpass, MD5(Wordpress), MD5(phpBB3)                    400
  md5crypt, MD5(Unix), FreeBSD MD5, Cisco-IOS MD5        500
  SHA-1(Django)                                          800
  MD4                                                    900
  NTLM                                                   1000
  Domain Cached Credentials, mscash                      1100
  SHA256                                                 1400, 1410, 1420
  HMAC-SHA256                                            1450, 1460
  md5apr1, MD5(APR), Apache MD5                          1600
  SHA512                                                 1700, 1710, 1720 
  HMAC-SHA512                                            1750, 1760
  SHA-512(Unix)                                          1800  
  Double MD5                                             2600
  MD5(Sun)                                               3300
  md5                                                    3500, 3610, 3710, 3810, 3910, 4010, 4110, 4210
  md5(strtoupper)                                        4300
  md5(sha1)                                              4400, 4500, 4500, 4600 
  sha1(md5)                                              4700
  MD5(Chap)                                              4800
  SHA-3(Keccak)                                          5000\e[0m"
  
# read -p "Su Sistema Operativo esta Nativamente en 32 bit o 64 bit" 32 64
     read -p "Ingrese el Número de su Algoritmo en que se Encuentra su Hash: " Algo
     read -p "Ingrese el pat donde se encuentran los hash a crackear por ejemplo /home/user/hash.txt: " hash
     read -p "ingrese el pat donde se encuentran el diccionario por ejemplo /home/user/diccionario.txt: " dic
     read -p "Ingrese el pat donde quiere los resultados del proceso por ejemplo /home/user/resultados.txt: " resul
 clear
echo "\e[1;37mESTO PUEDE DEMORAR MINUTOS U HORAS DEPENDIENDO DEL DICCIONARIO Y LA CANTIDAD DE HASH A DESCRIPTAR\e[0m"
 
./hashcat-cli32.bin -a 0 -m $algo $hash $dic --output-file=$result --remove

    Continuar;;

 2)
 clear
   read -p "Ingrese el Número de su Algoritmo en que se Encuentra su Hash: " Algo
   read -p "Ingrese el pat donde se encuentran los hash a crackear por ejemplo /home/user/hash.txt: " hash
   read -p "ingrese el pat donde se encuentran el diccionario por ejemplo /home/user/diccionario.txt: " dic
   read -p "Ingrese el pat donde quiere los resultados del proceso por ejemplo /home/user/resultados.txt: " resul
 clear
echo "\e[1;37mESTO PUEDE DEMORAR MINUTOS U HORAS DEPENDIENDO DEL DICCIONARIO Y LA CANTIDAD DE HASH A DESCRIPTAR\e[0m"
 
./hashcat-cli32.bin -a 1 -m $algo $hash $dic --output-file=$result --remove

    Continuar;;
 3)
 clear
    read -p "Ingrese el Número de su Algoritmo en que se Encuentra su Hash: " Algo
    read -p "Ingrese el pat donde se encuentran los hash a crackear por ejemplo /home/user/hash.txt: " hash
    read -p "ingrese el pat donde se encuentran el diccionario por ejemplo /home/user/diccionario.txt: " dic
    read -p "Ingrese el pat donde quiere los resultados del proceso por ejemplo /home/user/resultados.txt: " resul
 clear
echo "\e[1;37mESTO PUEDE DEMORAR MINUTOS U HORAS DEPENDIENDO DEL DICCIONARIO Y LA CANTIDAD DE HASH A DESCRIPTAR\e[0m"
 
./hashcat-cli32.bin -a 2 -m $algo $hash $dic --output-file=$result --remove

    Continuar;;
 4)
 clear
     read -p "Ingrese el Número de su Algoritmo en que se Encuentra su Hash: " Algo
     read -p "Ingrese el pat donde se encuentran los hash a crackear por ejemplo /home/user/hash.txt: " hash
     read -p "ingrese el pat donde se encuentran el diccionario por ejemplo /home/user/diccionario.txt: " dic
     read -p "Ingrese el pat donde quiere los resultados del proceso por ejemplo /home/user/resultados.txt: " resul
 clear
echo "\e[1;37mESTO PUEDE DEMORAR MINUTOS U HORAS DEPENDIENDO DEL DICCIONARIO Y LA CANTIDAD DE HASH A DESCRIPTAR\e[0m"
 
./hashcat-cli32.bin -a 4 -m $algo $hash $dic --output-file=$result --remove

    Continuar;;
    
 5)
 clear
     read -p "Ingrese el Número de su Algoritmo en que se Encuentra su Hash: " Algo
     read -p "Ingrese el pat donde se encuentran los hash a crackear por ejemplo /home/user/hash.txt: " hash
     read -p "ingrese el pat donde se encuentran el diccionario por ejemplo /home/user/diccionario.txt: " dic
     read -p "Ingrese el pat donde quiere los resultados del proceso por ejemplo /home/user/resultados.txt: " resul
     read -p "Ingrese el pat con su Tabla generada, por ejemplo /home/user/reglas.txt. Las Reglas podemos generarlas
     nosotros mismos por ejemplo reemplazar las Vocales por numeros y tendriamos que poner en reglas.txt algo así
     a=1 e=2 i=3 o=4 u=5 en el archivo, podemos ver un ejemplo en /t00ls/hashcat/reglas/reglas.txt: " reglas
 clear
echo "\e[1;37mESTO PUEDE DEMORAR MINUTOS U HORAS DEPENDIENDO DEL DICCIONARIO Y LA CANTIDAD DE HASH A DESCRIPTAR\e[0m"
 
./hashcat-cli32.bin -a 5 -m $algo $hash $dic --output-file=$result --remove --table-file=$reglas --table-min=1 --table-max=20

    Continuar;;
 esac
done
}


##
## Aca tenemos un while correspondiente al menu Principal
##


while [ 8 ]
do
        MenuPrincipal

        read -p " Ingresa tu Opcion: " OPCION

        case $OPCION in

"0")
    clear
    Nmap;;

"1")
    clear
    ScanRed;;

"2")
    clear
    SeguridadWeb;;
    
"3")
    clear
    Keyloguer;;
    
"4")
    clear
    SeguridadWifi;;
    
"5")
    clear
    SeguridadRegistros;;
"6")
    clear
    SeguridadTCP;;
"7")
    clear
    SeguridadForense;;
    
"8") 
    clear
    Hashcat;;
##

## Fin de Najash
"9")
    clear
   echo "\e[1;36m GRACIAS POR USAR NAJASH \e[0m"
   exit
    esac
done
