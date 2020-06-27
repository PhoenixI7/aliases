#! /bin/bash/

# Nipe install
cd ~/
git clone https://github.com/GouveaHeitor/nipe && cd nipe
sudo cpan install Try::Tiny Config::Simple JSON
sudo perl nipe.pl install
echo ""
tput setaf 2; echo "Nipe Installed!!!"
echo ""

#BlackEye install
cd ~/
git clone https://github.com/thelinuxchoice/blackeye
cd blackeye
echo ""
tput setaf 2; echo "BlackEye Installed!!!"
echo ""

#HiddenEye install
cd ~/
sudo apt-get install python3 python3-pip
git clone https://github.com/DarkSecDevelopers/HiddenEye.git
cd HiddenEye
pip3 install -r requirements.txt
echo ""
tput setaf 2; echo "HiddenEye Installed!!!"
echo ""

#Sherlock install
cd ~/
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
python3 -m pip install -r requirements.txt
echo ""
tput setaf 2; echo "Sherlock Installed!!!"
echo ""

#Bashrc edit
echo "" >> ~/.bashrc
echo "alias lazy='cd ~/aliases && bash aliases.sh && cd'" >> ~/.bashrc
echo ""
tput setaf 2; echo "Edited ~/.bashrc"
echo ""

#Ngrok
cd ~/
echo ""
tput setaf 1; echo "Please go to https://ngrok.com/download to install ngrok!!!"
echo ""
tput setaf 2; echo "DONE!"

#Delete install Script
rm ~/aliases/install.sh