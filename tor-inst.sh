#!/bin/zsh
sudo clear
sudo echo "--------------------------------------------------------"
sudo echo "                  Tor Manager v0.1"
sudo echo "             by Sam Victor(@matchaswirls)"
sudo echo "--------------------------------------------------------"
sudo echo "Tor will automatically start after installation runs."
sleep 1

sudo echo "Press 1 for Tor and homebrew to be installed"
sudo echo "Press 2 for ONLY Tor to be installed. Select only if you have homebrew already installed."
sudo echo "Press 3 to start tor."
sudo echo "Press 4 to stop tor"
vared -cp 'Enter desired function:' input_main
case $input_main in
'1')
    sudo clear
    xcode-select --install
    sudo echo "Enter a if you are using MacOS version lesser than 10.15(lower than Catalina)"
    sudo echo "Enter b if you are using MacOS Catalina or later."
    sudo echo "Check MacOS by: apple symbol in top right>about this mac"
    vared -cp 'Select:' input_switch1
    case $input_switch1 in
    'a')
        sudo clear
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        sleep 3
        brew install tor
        sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 9050
        sudo echo "Tor SOCKS proxy set."
        sleep 1 
        sudo networksetup -setsocksfirewallproxystate Wi-Fi on
        sudo echo "Tor SOCKS listening port active."
        sleep 1
        sudo echo "Starting Tor..."
        sleep 3
        tor
        ;;
    'b')
        sudo clear
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        sleep 3
        brew install tor
        sudo networksetup-setsocksfirewallproxy Wi-Fi 127.0.0.1 9050
        sudo echo "Tor SOCKS proxy set."
        sleep 1
        sudo networksetup -setsocksfirewallproxystate Wi-Fi on
        sudo echo "Tor SOCKS listening port active."
        sleep 1
        sudo echo "Starting Tor..."
        sleep 2
        tor
        ;;
    esac
    ;;
'2')
    brew install tor
    sleep 2
    sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 9050
    sudo echo "Tor SOCKS proxy set."
    sleep 1
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    sudo echo "Tor SOCKS proxy active."
    sleep 1
    sudo echo "Starting Tor..."
    sleep 3
    tor
    ;;
'3')
    sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 9050
    sudo echo "Tor SOCKS proxy set."
    sleep 1
    sudo networksetup -setsocksfirewallproxystate Wi-Fi on
    sudo echo "Tor SOCKS proxy active."
    sleep 1
    sudo echo "Starting Tor..."
    sleep 3
    tor
    ;;
 '4')
    sudo clear
    sudo echo "Stopping Tor."
    sudo brew services stop tor 
    sudo networksetup -setsocksfirewallproxystate Wi-Fi off
    sleep 2
    sudo echo "Tor Stopped."
    ;;
esac
    
