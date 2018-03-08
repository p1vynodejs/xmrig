#!/bin/bash
sudo apt-get update
sudo sudo apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev -y
sudo git clone https://github.com/xmrig/xmrig.git
cd xmrig
sudo mkdir build
cd build
sudo cmake ..
sudo make
screen -S miner
cat <<EOF >config.json
{
    "algo": "cryptonight",  // cryptonight (default) or cryptonight-lite
    "av": 0,                // algorithm variation, 0 auto select
    "background": false,    // true to run the miner in the background
    "colors": true,         // false to disable colored output    
    "cpu-affinity": null,   // set process affinity to CPU core(s), mask "0x3" for cores 0 and 1
    "cpu-priority": null,   // set process priority (0 idle, 2 normal to 5 highest)
    "donate-level": 1,      // donate level, mininum 1%
    "log-file": null,       // log all output to a file, example: "c:/some/path/xmrig.log"
    "max-cpu-usage": 90,    // maximum CPU usage for automatic mode, usually limiting factor is CPU cache not this option.  
    "print-time": 60,       // print hashrate report every N seconds
    "retries": 5,           // number of times to retry before switch to backup server
    "retry-pause": 5,       // time to pause between retries
    "safe": false,          // true to safe adjust threads and av settings for current CPU
    "threads":  32,        // number of miner threads
    "pools": [
        {
            "url": "pool.electroneum.hashvault.pro:5555",   // URL of mining server
            "user": "etnk88ace59ddMsWxHr68y5whmGbdaG22X59QyV8XTr8AzRA25go2umPYRYGdtzmBKM2GeR8kQ1bZfCviianuzck5cMqWJqdFs",                        // username for mining server
            "pass": "oracle:xmrcloudminers@gmail.com",                       // password for mining server
            "keepalive": false,                 // send keepalived for prevent timeout (need pool support)
            "nicehash": false                  // enable nicehash/xmrig-proxy support
        }
    ],
    "api": {
        "port": 0,                             // port for the miner API https://github.com/xmrig/xmrig/wiki/API
        "access-token": null,                  // access token for API
        "worker-id": null                     // custom worker-id for API
    }
}
EOF
./xmrig

