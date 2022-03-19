#!/bin/bash
# GnuPG-2.2.34 installer script

# run the line which is below before run this script
# export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

# to remove all gpg/gnupg apps
sudo apt-get remove gpg -y; sudo apt-get remove gnupg -y; sudo apt-get remove gnupg2 -y;

# to update/upgrade system
sudo apt-get update -y && sudo apt-get upgrade -y

# to install pass and requirements which is necessary to install GnuPG-2.2.34
sudo apt-get install pass -y && sudo apt-get install build-essential -y && sudo apt-get install pinentry-curses -y;

# to fetch GnuPG-2.2.34 and its dependencies 
wget https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2 https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.44.tar.bz2 https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.0.tar.bz2 https://gnupg.org/ftp/gcrypt/libksba/libksba-1.6.0.tar.bz2 https://gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.5.tar.bz2 https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.34.tar.bz2
tar -xjvf npth-1.6.tar.bz2 && tar -xjvf libgpg-error-1.44.tar.bz2 && tar -xjvf libgcrypt-1.10.0.tar.bz2 && tar -xjvf libksba-1.6.0.tar.bz2 && tar -xjvf libassuan-2.5.5.tar.bz2 && tar -xjvf gnupg-2.2.34.tar.bz2

# to remove all *tar.bz2 files
rm *tar.bz2;

# to build & install GnuPG-2.2.34 and its dependencies
cd npth-1.6/ && sudo ./configure && sudo make && sudo make install && cd ..;
cd libgpg-error-1.44/ && sudo ./configure && sudo make && sudo make install && cd ..;
cd libgcrypt-1.10.0/ && sudo ./configure && sudo make && sudo make install && cd ..;
cd libksba-1.6.0/ && sudo ./configure && sudo make && sudo make install && cd ..;
cd libassuan-2.5.5/ && sudo ./configure && sudo make && sudo make install && cd ..;
cd gnupg-2.2.34/ && sudo ./configure && sudo make && sudo make install && cd ..;

# to clean unncesseary files and folders
sudo rm -rf npth-1.6/ libgpg-error-1.44/ libgcrypt-1.10.0/ libksba-1.6.0/ libassuan-2.5.5/ gnupg-2.2.34/

# run GnuPG for a second to create its own directory which is '~/.gnupg' then create gpg-agent.conf file
timeout 1s gpg; echo pinentry-program /usr/bin/pinentry-curses > ~/.gnupg/gpg-agent.conf && gpg-connect-agent reloadagent /bye;