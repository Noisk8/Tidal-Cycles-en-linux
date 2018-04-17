# Tidal-Cycles-en-linux

Script para instalar Tidal Cycles en Debian o ubuntu

## Guía de utilización 
***

### 1er paso

Clonar el repositorio 

> git clone https://github.com/Noisk8/Tidal-Cycles-en-linux

***
### 2do paso 

accedemos a la carpeta que clonamos y le damos los permisos al script 

Damos los permisos para hacer ejecutable el script

cd Tidal-Cycles-en-linux

chmod +x Tidal.sh

y lo ejecutamos

***
### 3er paso 

ejecutar el script

./Tidal.sh

Despues de ejecutar el script debemos de hacer un paso más, se trata de instalar los quarks a través de Supercollider

Abrimos Supercollider y ejecutamos las siguientes lineas

Nota: En algunas distribuciones basadas en ubuntu como por ejemplo mint o xubuntu con el comando sudo apt-get install supercollider 
se instala la versión 3.6 con la que es imposible que tidal funcione, si este es tu caso puedes utilizar este script para compilar una versión posterior.

[Supercollider script](https://noiskate.hotglue.me/?Sc/)
