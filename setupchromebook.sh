# setup
#!/bin/bash

apt-get update
apt-get install vim wget curl git rake


echo install chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
# Set repository:
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#Install package:
sudo apt-get update 
sudo apt-get install -q google-chrome-stable

echo install cerebro

wget --quiet --output-document=temp "https://github.com/KELiON/cerebro/releases/download/v0.2.8/cerebro_0.2.8_amd64.deb" ; dpkg --install temp

echo installing dotfiles
git clone https://github.com/collingridge/dotfiles
pushd dotfiles
rake install
popd

echo chromebook fixes and tweaks
curl -LOk https://github.com/fascinatingcaptain/CBFixesAndTweaks/archive/master.tar.gz; tar -zxvf master.tar.gz; cd CBFixesAndTweaks-master; sudo -E bash CBFixesAndTweaks.sh


