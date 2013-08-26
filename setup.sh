#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
#sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

#heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
sudo apt-get install -y npm
npm install -g jshint
npm install cheerio
npm install restler
npm install commander

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install firefox and xvfb for capturing web pages
sudo aptitude -y install xvfb #an X client
sudo aptitude -y install firefox
sudo apt-get -y install unzip
sudo apt-get -y install openjdk-7-jdk #java

#setting up display
Xvfb :99
export DISPLAY=:99





## Install emacs24
## https://launchpad.net/~cassou/+archive/emacs
#sudo apt-add-repository -y ppa:cassou/emacs
#sudo apt-get update
#sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
#
## git pull and install dotfiles as well
#cd $HOME
#if [ -d ./dotfiles/ ]; then
#    mv dotfiles dotfiles.old
#fi
#if [ -d .emacs.d/ ]; then
#    mv .emacs.d .emacs.d~
#fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

#git configuration
git config --global user.name "Yu Jin"
git config --global user.email yujin.umn@gmail.com


