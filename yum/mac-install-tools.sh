#!/bin/bash
# list of tools to install to start development with java, scala, r, and python

set -e
 
# Install brew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 
# Install common bash tools
brew install wget
brew install curl
brew install jq
brew install tree
brew install git
# brew cask install java
brew cask install caskroom/versions/java8
brew install python3
brew install scala
brew install sbt
brew install maven
brew install awscli
brew install docker docker-compose
brew install apache-spark
brew install r
 
# mxnet
brew install pkg-config
brew install graphviz
brew install openblas
brew tap homebrew/core
brew install opencv
 
# Get pip
easy_install pip
 
# For visualization of network graphs
pip install graphviz
 
# Jupyter notebook
pip install jupyter
 
# install applications
#brew cask install dropbox
brew cask install google-chrome
brew cask install intellij-idea-ce pycharm-ce
brew cask install sublime-text
brew cask install --appdir=/Applications rstudio
 
