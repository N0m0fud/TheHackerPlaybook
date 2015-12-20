#! /bin/bash

# Script to install programs recommended by Peter Kim in The hacker Playbook
# Written 8/23/2015 - N0M0FUD

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "Install Script for Kali 2.0 Setup of Programs"
    echo -e "Recommended in \"The Hacker Playbook\" by Peter Kim"
    echo -e "Courtesy of N0M0FUD - August 23, 2015"
    echo -e "All Tools Installed in the /opt/ Folder"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Install Discover Scripts ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Install SMB Exec ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Install Veil ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} Save Customer Password Lists ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} Set Up Peeping Tom ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU} Add Banner Plus Nmap Script ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7)${MENU} Install PowerSploit ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8)${MENU} Install Responder ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9)${MENU} Install Fuzzing Lists (SecLists) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10)${MENU} Info On Other Programs ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}

function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

function Install_Discover_Scripts() {
    echo -e "Checking for existing install . . ."
    file=/opt/discover/setup.sh
    if [ -e "$file" ]
    then 
	echo -e "Discover Scripts appear to be installed."
	echo -e "Do you wish to update the Discover Scripts? (y or n)"
        read subopt
        if [[ $subopt = "y" ]]
        then
            echo -e "Updating Discover Scripts . . . "
            cd /opt/discover/
	    ./update.sh
	    echo -e "Discover Scripts successfully updated. Press Enter to Return to the Main Menu."
         else 
            echo -e "Discover Scripts NOT updated. Press Enter to Return to the Main Menu."
         fi
    else
	echo -e "Discover Scripts not installed. Installing now. May take a while. Be patient . . ."
	echo -e "Changing to /opt . . . "
        cd /opt/
        git clone https://github.com/leebaird/discover.git
        cd discover
        ./update.sh
        echo -e "Discover Scripts successfully installed. Press Enter to Return to the Main Menu."
    fi
}

function Install_Smbexec() {
    echo -e "Checking for existing install . . ."
    file=/opt/smbexec/install.sh
    if [ -e "$file" ]
    then 
	echo -e "Smbexec appears to be installed."
	echo -e "Press Enter to Return to the Main Menu."
    else
	echo -e "Snbexec not installed. Installing now. May take a while. Be patient . . ."
	echo -e "Changing to /opt . . . "
        cd /opt/
        git clone https://github.com/brav0hax/smbexec.git
        cd smbexec
        ./install.sh
        echo -e "Smbexec successfully installed. Press Enter to Return to the Main Menu."
    fi
}

function Install_Veil() {
    echo -e "Checking for existing install . . ."
    file=/opt/Veil/setup/setup.sh
    if [ -e "$file" ]
    then 
	echo -e "Veil appears to be installed."
	echo -e "Press Enter to Return to the Main Menu."
    else
	echo -e "Veil not installed. Installing now. May take a while. Be patient . . ."
	echo -e "Changing to /opt . . . "
        cd /opt/
        git clone https://github.com/veil-evasion/Veil.git
        cd ./Veil/setup
        ./setup.sh
        echo -e "Veil successfully installed. Press Enter to Return to the Main Menu."
    fi
}


function Install_Password_Lists() {
    echo -e "Checking for existing install of Crackstation Human Only Password List. . ."
    file=~/Desktop/password_list/crackstation-human-only.txt
    if [ -e "$file" ]
    then 
	echo -e "Crackstation Human Only Password List already installed"
    else
	echo -e "Crackstation Human Only Password List not found. Installing now. May take a while. Be patient . . ."
	echo -e "Changing to ~/Desktop . . . "
        cd ~/Desktop/
	echo -e "Creating directory . . . "
        mkdir ./password_list
        cd ./password_list
        echo -e "Downloading file . . . "
        wget https://www.dropbox.com/s/ucreldsa3qt1rms/crackstation-human-only.txt.gz?dl=1
	echo -e "Renaming file . . . "
        mv crackstation-human-only.txt.gz?dl=1 crackstation-human-only.txt.gz 
	echo -e "Unzipping file . . . "
        gzip -d crackstation-human-only.txt.gz
	echo -e "Removing compressed file . . . "
        rm -f ~/Desktop/password_list/crackstation-human-only.txt.gz?dl=1
        echo -e "Crackstation Human Only Password List successfully installed."
    fi
    echo -e "Checking for existing install of Rock You Password List. . ."
    file=~/Desktop/password_list/rockyou.txt
    if [ -e "$file" ]
    then 
	echo -e "Rock You Password List already installed."
	echo -e "Press Enter to Return to the Main Menu."
    else
	echo -e "Rock You Password List not found. Installing now. May take a while. Be patient . . ."
	echo -e "Changing to ~/Desktop/password_list . . . "
        cd ~/Desktop/password_list/
        echo -e "Downloading file . . . "
        wget https://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
	echo -e "Unzipping file . . . "
        bzip2 -d rockyou.txt.bz2
	echo -e "Removing compressed file . . . "
        rm -f rockyou.txt.bz2
        echo -e "Rock You Password List successfully installed."
        echo -e "Press Enter to Return to the Main Menu."
    fi

}

Install_Peeping_Tom() {
	echo -e "Checking for existing install of Peeping Tom. . ."
	file=/opt/peepingtom
    	if [ -e "$file" ]
    	then 
		echo -e "Peeping Tom appears to be installed . . ."
		echo -e "Press Enter to Return to the Main Menu."
   	 else
		echo -e "Peeping Tom not installed. Installing now. May take a while. Be patient . . ."
		echo -e "Changing to /opt . . . "
       		cd /opt/
        	git clone https://bitbucket.org/LaNMaSteR53/peepingtom.git
        	cd ./peepingtom/
        	echo -e "Grabbing Nop Slider . . ."
 		wget https://gist.githubusercontent.com/nopslider/5984316/raw/423b02c53d225fe8dfb4e2df9a20bc800cc78e2c/gnmap.pl
		echo -e "Installing Phantom JS"
		if [$(uname -m | grep '64' )]
		then
			echo -e "Grabbing 64 bit archive from Google . . ."
    			wget http://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
                        echo -e "Extracting archive . . ."
    			tar -xvjf phantomjs-1.9.2-linux-x86_64.tar.bz2
			echo -e "Removing archive file . . ."
    			rm -f phantomjs-1.9.2-linux-x86_64.tar.bz2
			echo -e "Done . . . "
		else
			echo -e "Grabbing 32 bit archive from Google . . ."
    			wget http://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-i686.tar.bz2
			echo -e "Extracting archive . . ."
    			tar -xvjf phantomjs-1.9.2-linux-i686.tar.bz2
			echo -e "Removing archive file . . ."
    			rm -f phantomjs-1.9.2-linux-i686.tar.bz2
			echo -e "Done . . . "
		fi
        	echo -e "Peeping Tom, Nop Slider & Phantom JS successfully installed. Press Enter to Return to the Main Menu."
    	fi
}

Install_Banner_Plus() {
	echo -e "Checking for existing install of Banner Plus Nmap Script. . ."
	file=/usr/share/nmap/scripts/banner-plus.nse
    	if [ -e "$file" ]
    	then 
		echo -e "Banner Plus Nmap Script appears to be installed . . ."
		echo -e "Press Enter to Return to the Main Menu."
   	else
		echo -e "Banner Plus Nmap Script not installed. Installing now. May take a while. Be patient . . ."
		cd /usr/share/nmap/scripts/
		wget https://raw.githubusercontent.com/hdm/scan-tools/master/nse/banner-plus.nse
		echo -e "Banner Plus Nmap Script successfully installed. Press Enter to Return to the Main Menu."
	fi
}

Install_Power_Sploit() {
	echo -e "Checking for existing install of PowerSploit. . ."
	file=/opt/PowerSploit/
    	if [ -e "$file" ]
    	then 
		echo -e "PowerSploit appears to be installed . . ."
		echo -e "Press Enter to Return to the Main Menu."
	else
		echo -e "PowerSploit not installed. Installing now. May take a while. Be patient . . ."
		cd /opt/
		git clone https://github.com/mattifestation/PowerSploit.git
		cd /opt/PowerSploit/
		wget https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py
		wget https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py
		echo -e "PowerSploit successfully installed. Press Enter to Return to the Main Menu."
	fi
}

Install_Responder() {
	echo -e "Checking for existing install of Responder. . ."
	file=/opt/Responder/
    	if [ -e "$file" ]
    	then 
		echo -e "Responder appears to be installed . . ."
		echo -e "Press Enter to Return to the Main Menu."
	else
		echo -e "Responder not installed. Installing now. May take a while. Be patient . . ."
		cd /opt/
		git clone https://github.com/SpiderLabs/Responder.git
		echo -e "Responder successfully installed. Press Enter to Return to the Main Menu."
	fi
}

Install_Sec_Lists() {
	echo -e "Checking for existing install of Sec Lists. . ."
	file=/opt/SecLists/
    	if [ -e "$file" ]
    	then 
		echo -e "SecLists appears to be installed . . ."
		echo -e "Press Enter to Return to the Main Menu."
	else
		echo -e "SecLists not installed. Installing now. May take a while. Be patient . . ."
		cd /opt/
		git clone https://github.com/danielmiessler/SecLists.git
		echo -e "SecLists successfully installed. Press Enter to Return to the Main Menu."
	fi

}

Show_Info() {
	echo -e "Changes in Needed Tools Install in Kali 2.0"
	echo -e "Windows Credential Editor is installed during the Discover Scripts installation."
	echo -e "Mimikatz is now installed by default in the Kali 2.0 distribution."
	echo -e "Burp is now installed by default in the Kali 2.0 distribution."
	echo -e "Social Engineering Toolkit is installed by default in the Kali 2.0 distribution."
	echo -e "The Bypass UAC post exploitation module is now built into Metasploit."
	echo -e "BeEF is now installed by default in the Kali 2.0 distribution."
	echo -e "Happy Hacking! Press Enter to Return to the Main Menu."
}

clear
show_menu

while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
           option_picked "Install Discover Scripts";
           Install_Discover_Scripts;
           read opt;
           clear;
           show_menu;
        ;;

        2) clear;
           option_picked "Install SMB Exec";
           Install_Smbexec;
           read opt;
           clear;
           show_menu;
            ;;

        3) clear;
           option_picked "Install Veil";
           Install_Veil;
           read opt;
           clear;
           show_menu;
            ;;

        4) clear;
           option_picked "Save Customer Password Lists";
           Install_Password_Lists;
           read opt;
           clear;
           show_menu;
            ;;

        5) clear;
           option_picked "Set Up Peeping Tom";
	   Install_Peeping_Tom;
	   read opt;
	   clear;
           show_menu;
            ;;
        
        6) clear;
           option_picked "Add Banner Plus Nmap Script";
      	   Install_Banner_Plus;
	   read opt;
	   clear;
           show_menu;
           ;;

        7) clear;
           option_picked "Install PowerSploit";
      	   Install_Power_Sploit;
	   read opt;
	   clear;
           show_menu;
           ;;

        8) clear;
           option_picked "Install Responder";
           Install_Responder;
	   read opt;
	   clear;
           show_menu;
           ;;

        9) clear;
           option_picked "Install Fuzzing Lists \(SecLists\)";
           Install_Sec_Lists;
	   read opt;
	   clear;
           show_menu;
           ;;

        10) clear;
           option_picked "Info On Other Programs";
           Show_Info;
	   read opt;
	   clear;
           show_menu;
           ;;


        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done