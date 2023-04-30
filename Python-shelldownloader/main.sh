#!/bin/zsh
brew install figlet
brew install lolcat
sudo clear
figlet "YT Video Downloader" | lolcat
sudo echo "             by Sam Victor(@matchaswirls)"
sudo echo "This script requires Python 3 to be installed. Make sure you have python 3 installed. Type 3 to install python 3. To install python3, Homebrew will be used."
sleep 5
sudo echo "If get a SSL error after pasting in a link, type 2."
sudo echo "Press 1 to continue."
vared -cp '>' input_main
case $input_main in
'1')
    pip3 install pytube
    cd 
    cd Desktop/Python-shelldownloader
    python3 download.py
    ;;
'2')
    cd /
    cd Applications/Python\ 3.11
    pwd
    sleep 2
    sudo sh Install\ Certificates.command
    pip3 install pytube
    cd 
    cd Desktop/Python-shelldownloader
    sudo python3 download.py
    ;;
'3')
    brew install python
    brew upgrade python
    pip3 install pytube
    cd 
    cd Desktop/Python-shelldownloader
    python3 download.py
    ;;
esac
