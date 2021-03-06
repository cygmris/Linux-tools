
#!/bin/bash 

echo " " 
echo "Note: This script is designed for new installs of Ubuntu 18.04 and flavors. " 
echo "If you already have a system with lots of custom repos, things may conflict. " 
echo "This script will execute in a few seconds unless you press Ctrl+Z to exit. " 
echo " " 
sudo sleep 10 # "sudo" before sleep elevates this script to sudo priviliges after the password prompt 

# Start with updates 

sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# Important stuff that should be done first 

sudo dpkg --add-architecture i386 
sudo apt install -y apt-transport-https 
sudo apt install -y dirmngr # Mono needs it 

# Mono stuff 

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF 
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list 
echo "deb https://download.mono-project.com/repo/ubuntu vs-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-vs.list 

# Itch stuff 

wget -O - https://dl.itch.ovh/archive.key | sudo apt-key add - 
ITCHIO_DEB="deb https://dl.bintray.com/itchio/deb xenial main" 
echo $ITCHIO_DEB | sudo tee /etc/apt/sources.list.d/itchio.list 

# Wine stuff 

wget https://dl.winehq.org/wine-builds/Release.key 
sudo apt-key add Release.key 
sudo rm -f Release.key 
sudo apt-add-repository -y https://dl.winehq.org/wine-builds/ubuntu/ 
sudo sed -i -e 's/scope = 1/scope = 0/g' /etc/sysctl.d/10-ptrace.conf

# Other repos 

sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer 
sudo add-apt-repository -y ppa:notepadqq-team/notepadqq 

# Get rid of all existing Snap apps. WARNING: This is meant for new installs only! 

sudo apt purge -y snapd 
sudo apt install -y snapd 

# More updates 

sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 


# These packages should be installed first 

sudo apt install -y openssh-server 
sudo apt install -y vlc # Depends on a lot of *specific versions* of libraries 

# Misc libraries, I recommend keeping everything here 

sudo apt install -y curl 
sudo apt install -y exfat-* 
sudo apt install -y flac 
sudo apt install -y gconf2 
sudo apt install -y gvfs-bin 
sudo apt install -y lame 
sudo apt install -y lib32z1
sudo apt install -y lib32ncurses5 
sudo apt install -y lib32stdc++6 
sudo apt install -y libappindicator1 
sudo apt install -y libc++1 
sudo apt install -y libcap2-bin 
sudo apt install -y libdbusmenu-gtk4 
sudo apt install -y libdbusmenu-gtk4:i386 # Steam 
sudo apt install -y libgnome-keyring-common
sudo apt install -y libgnome-keyring-dev
sudo apt install -y liblua5* 
sudo apt install -y libopenal1 
sudo apt install -y libsdl2* 
sudo apt install -y libsdl-ttf* 
sudo apt install -y libtcmalloc-minimal4 # Portal 2 
sudo apt install -y mono-complete 
sudo apt install -y openjdk-8-jre 
sudo apt install -y vulkan-utils 
sudo apt install -y x264 

# Developer tools, useful for everyone, ex: for compiling software 

sudo apt install -y build-essential 
sudo apt install -y cmake 
sudo apt install -y git 

# GitKraken stuff 

wget -O gitkraken.deb "https://release.gitkraken.com/linux/gitkraken-amd64.deb" 
sudo dpkg -i gitkraken.deb
sudo rm -f gitkraken.deb

# Discord stuff 

wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb" 
sudo dpkg -i discord.deb
sudo rm -f discord.deb

# Misc useful terminal stuff 

sudo apt install -y cmatrix 
sudo apt install -y cowsay 
sudo apt install -y ffmpeg 
sudo apt install -y fortune-mod 
sudo apt install -y htop 
sudo apt install -y icoutils 
sudo apt install -y mediainfo 
sudo apt install -y neofetch 
sudo apt install -y pv 
sudo apt install -y youtube-dl 

# Small useful GUI programs 

sudo apt install -y baobab 
sudo apt install -y dconf-editor 
sudo apt install -y engrampa 
sudo apt install -y gnome-system-monitor 
sudo apt install -y gparted 
sudo apt install -y grub-customizer 
sudo apt install -y psensor 
sudo apt install -y pcmanfm 
sudo apt install -y notepadqq 
sudo apt install -y qbittorrent 

# Large useful GUI programs 

sudo apt install -y chromium-browser 
sudo apt install -y firefox 
sudo apt install -y gimp 
sudo apt install -y libreoffice 

# Games and other things that can be installed last 

sudo apt install -y winehq-devel --install-recommends 
sudo apt install -y playonlinux 
sudo apt install -y itch 
sudo apt install -y libdvd-pkg 
sudo apt install -y steam 

# Finish with updates, this time update certs too 

sudo update-ca-certificates -f 
sudo apt update 
sudo apt upgrade -y 
sudo apt full-upgrade -y 

echo " " 
echo "Successfully installed the programs! " 
echo "You may wish to reboot your system now. " 
echo " " 





