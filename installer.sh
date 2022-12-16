#!/bin/bash


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
sudo apt-get update

sudo apt-get install curl golang chromium nmap




export GOROOT=/usr/local/go >> ~/.bashrc
export GOPATH=$HOME/go >> ~/.bashrc
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH >> ~/.bashrc
source ~/.bashrc


wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
sudo dpkg -i rustscan_2.0.1_amd64.deb
rm rustscan_2.0.1_amd64.deb
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo apt install chromium-l10n
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip
rm aquatone_linux_amd64_1.7.0.zip
sudo rm -rif aquatone_linux_amd64_1.7.0.zip LICENSE.txt README-cloudshell.txt
sudo mv aquatone /usr/local/bin
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
