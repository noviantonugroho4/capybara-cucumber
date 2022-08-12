#!/bin/bash

echo "Job type : $jobType"

echo "# ***** Install Depedency in Gemfile *****"
[ ! -e /var/lib/dpkg/lock-frontend ] || sudo rm /var/lib/dpkg/lock-frontend
[ ! -e /var/lib/apt/lists/lock ] || sudo rm /var/lib/apt/lists/lock
sudo apt-get clean
sudo apt-get update
[ ! -e /var/lib/dpkg/lock-frontend ] || sudo rm /var/lib/dpkg/lock-frontend
[ ! -e /var/lib/apt/lists/lock ] || sudo rm /var/lib/apt/lists/lock
[ ! -e /var/lib/dpkg/lock-frontend ] || sudo rm /var/lib/dpkg/lock-frontend
[ ! -e /var/lib/dpkg/lock ] || sudo rm /var/lib/dpkg/lock
[ ! -d /var/cache/apt/archives ] || sudo rm -rf /var/cache/apt/archives
sudo rm /var/lib/dpkg/updates/*
sudo mv /var/lib/dpkg/updates/0001 /var/lib/dpkg/updates/0001.X
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get install -y --fix-missing curl unzip libnss3
sudo apt-get install build-essential -y
sudo apt-get install --reinstall zlibc zlib1g zlib1g-dev

if [[ $jobType == 'web' ]]; then
    cd web
    ls

    echo "# ***** Install Chromedriver *****"
    [ ! -d /opt/chromedriver-89.0.4389.23 ] || sudo rm -rf /opt
    sudo mkdir -p /opt/chromedriver-89.0.4389.23
    sudo curl -sS -o /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip
    sudo unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-89.0.4389.23
    sudo rm /tmp/chromedriver_linux64.zip
    sudo chmod +x /opt/chromedriver-89.0.4389.23/chromedriver
    sudo ln -fs /opt/chromedriver-89.0.4389.23/chromedriver /usr/local/bin/chromedriver

    echo "# ***** Install Chrome Browser *****"
    sudo curl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add
    sudo wget --no-verbose -O /tmp/chrome.deb http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_89.0.4389.90-1_amd64.deb
    [ ! -e /var/lib/dpkg/lock-frontend ] || sudo rm /var/lib/dpkg/lock-frontend
    [ ! -e /var/lib/apt/lists/lock ] || sudo rm /var/lib/apt/lists/lock
    sudo apt install -y /tmp/chrome.deb
    sudo rm /tmp/chrome.deb
    sudo apt-get install -y -f
    sudo rm -rf /var/lib/apt/lists/*
elif [[ $jobType == 'api' ]]; then
    cd api-testing
    ls
fi

cp .env.sample .env
cat .env
ruby -v
mkdir -p jsonSatu
cd ..

echo "# ***** Install Gemfile Requirement *****"
sudo gem install bundler -v '1.17.3'
sudo bundle install