
#!/bin/bash

echo Installing dependencies..
sudo apt-get update
sudo apt-get install haskell-platform supercollider sc3-plugins build-essential git qjackctl cabal-install zlib1g-dev libportmidi-dev libasound2-dev

echo Agregando usuario a grupo 'audio' 
sudo adduser $USER audio

if [ -e /usr/bin/atom ]; then
    echo Atom Ya esta instalado
else
   echo Installing atom
   wget --output-document=/tmp/atom.deb http://atom.io/download/deb
   sudo dpkg -i /tmp/atom.deb
   sudo apt --fix-broken install -y
fi
   
echo Installing/updating atom tidalcycles package
apm install tidalcycles

echo Installing/updating the tidal pattern engine, and tidal-midi
cabal update
cabal install Cabal
cabal install tidal
cabal install tidal-midi


mkdir -p ~/.local/share/SuperCollider/downloaded-quarks/
cd ~/.local/share/SuperCollider/downloaded-quarks/
if [ -d ./SuperDirt ]; then
    echo ** Updating SuperDirt
    cd SuperDirt
    git pull
    cd -
else
    echo ** Installing SuperDirt quark
    git clone https://github.com/musikinformatik/SuperDirt.git
fi

if [ -d ./Vowel ]; then
    echo ** Updating Vowel quark
    cd Vowel
    git pull
    cd -
else
    echo ** Installing Vowel quark
    git clone https://github.com/supercollider-quarks/Vowel.git
fi

if [ -d ./Dirt-Samples ]; then
    echo ** Updating Dirt-Samples quark
    cd Dirt-Samples
    git pull
    cd -
else
    echo ** Installing Dirt-Samples quark, this may take a little while
    git clone https://github.com/tidalcycles/Dirt-Samples.git
fi

echo Install process complete. It is a good idea to reboot now.
