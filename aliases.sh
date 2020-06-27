#! /bin/bash/

clear
echo "[1] Start Nipe"
echo "[2] Stop Nipe"
echo "[3] Run BlackEye"
echo "[4] Run HiddenEye"
echo "[5] Enter Monitor Mode"
echo "[6] Run Sherlock"
echo "[7] Start localhost"
echo "[8] Change MAC Address"
echo "[9] Ngrok"
read -p "Select from the above: " SELECTION

if [ "$SELECTION" == "1" ]
then
    echo " "
    cd ~/nipe
    echo "Starting Nipe..."
    sudo perl nipe.pl start
    echo "Getting Nipe status..."
    sudo perl nipe.pl status 
    cd

elif [ "$SELECTION" == "2" ]
then
    echo " "
    cd ~/nipe
    echo "Stoping Nipe..."
    sudo perl nipe.pl stop
    echo "Confirming Nipe status..."
    sudo perl nipe.pl status 
    cd

elif [ "$SELECTION" == "3" ]
then
    cd ~/blackeye
    bash blackeye.sh

elif [ "$SELECTION" == "4" ]
then
    cd ~/HiddenEye
    sudo python3 HiddenEye.py

elif [ "$SELECTION" == "5" ]
then
    sudo ifconfig wlan0 down
    sudo iwconfig wlan0 mode monitor
    sudo ifconfig wlan0 up

elif [ "$SELECTION" == "6" ]
then
    read -p "   Enter username for Sherlock: " USERNAME
    cd ~/sherlock
    read -p "   Use Tor? [y/n] " USETOR

    if [ "$USETOR" == "y" ]
    then
        python3 sherlock.py -t $USERNAME
        cd
    elif [ "$USETOR" == "n" ]
    then
        python3 sherlock.py $USERNAME
        cd
    else
        echo "You failed to enter [y/n]..."
        bash ~/aliases/aliases.sh
    fi

elif [ "$SELECTION" == "7" ]
then
    read -p "   Location of the folder you want to host: " LOCATION
    read -p "   Select port # (Default: 8000): " PORT
    cd ~/$LOCATION
    echo " "
    echo "Python Server at ~/$LOCATION on port $PORT..."
    python -m SimpleHTTPServer $PORT

elif [ "$SELECTION" == "8" ]
then
    read -p "   New MAC Address: " MACADDRESS
    echo " "
    sudo ifconfig wlan0 down
    sudo macchanger wlan0 -m $MACADDRESS
    sudo ifconfig wlan0 up
    echo " "

elif [ "$SELECTION" == "9" ]
then
    echo " "
    echo "  [a] Start Ngrok"
    echo "  [b] Edit Source"
    read -p "  Select from the above: " NGROK_SELECTION

    if [ "$NGROK_SELECTION" == "a" ]
    then
        read -p "  Select port #: " PORT_NUMBER
        cd ~/
        ./ngrok http localhost:$PORT_NUMBER
        echo " "

    elif [ "$NGROK_SELECTION" == "b" ]
    then
        nano ~/.ngrok2/ngrok.yml
    fi

else
    clear
    echo "Script Failed Nigga"
    bash ~/aliases/aliases.sh

fi
