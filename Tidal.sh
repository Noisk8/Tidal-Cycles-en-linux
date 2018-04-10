
#!/bin/bash

echo Instalando dependencias 
sudo apt-get update
sudo apt-get install haskell-platform supercollider sc3-plugins build-essential git qjackctl cabal-install zlib1g-dev libportmidi-dev libasound2-dev

echo Agregando usuario a grupo 'audio' 
sudo adduser $USER audio

if [ -e /usr/bin/atom ]; then
    echo Atom Ya esta instalado
else
   echo Instalando atom
   wget --output-document=/tmp/atom.deb http://atom.io/download/deb
   sudo dpkg -i /tmp/atom.deb
   sudo apt --fix-broken install -y
fi
   
echo Instalando actualizando paquete tidalcycles en atom
apm install tidalcycles

cabal update
cabal install Cabal
cabal install tidal
cabal install tidal-midi


mkdir -p ~/.local/share/SuperCollider/downloaded-quarks/
cd ~/.local/share/SuperCollider/downloaded-quarks/
if [ -d ./SuperDirt ]; then
    echo ** Actualizando SuperDirt
    cd SuperDirt
    git pull
    cd -
else
    echo ** Instalando SuperDirt quark
    git clone https://github.com/musikinformatik/SuperDirt.git
fi

if [ -d ./Vowel ]; then
    echo ** Actualizando Vowel quark
    cd Vowel
    git pull
    cd -
else
    echo ** Installing Vowel quark
    git clone https://github.com/supercollider-quarks/Vowel.git
fi

if [ -d ./Dirt-Samples ]; then
    echo ** Actualizando Dirt-Samples quark
    cd Dirt-Samples
    git pull
    cd -
else
    echo ** Instalanso Dirt-Samples quark
    git clone https://github.com/tidalcycles/Dirt-Samples.git
fi
