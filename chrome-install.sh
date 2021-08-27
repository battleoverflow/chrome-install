#!/bin/bash

#########################################################
# Creator: Hifumi-Sec                                    #
# Created: 08/07/2021                                   #
# Project: https://github.com/Hifumi-Sec/chrome-install  #
#########################################################

# Remember to make this file an executable by using: chmod +x chrome-install.sh

echo "Downloading Google Chrome..."

# Checks to see if you already have it installed
if command -v google-chrome &> /dev/null;
then
    echo "Google Chrome is already installed"
    exit
fi

# Creates a directory to store the .deb file
mkdir ~/Desktop/chrome_install && cd ~/Desktop/chrome_install

# Grabs the Chrome install from Google servers
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "Checking if you can use sudo..."

# Will ask for your password to make sure you have sudo permissions
if [ "$EUID" -ne 0];
then
    echo "Sudo needs to be enabled"
    exit
fi

# Installs Google package
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "Congrats, you now have Chrome!"

echo "Version downloaded: " && google-chrome --version

# Opens the browser for you. I know I'm so cool for doing this for you.
google-chrome &

# Uncomment these lines if you want to uninstall Google Chrome from your system
# Remember to comment all of the other lines before doing this
# sudo apt remove google-chrome-stable
# rm -r ~/.config/google-chrome