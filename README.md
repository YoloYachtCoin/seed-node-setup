# YYC Peer to Peer Node Setup Guide

Requirements:
1. Ubuntu server 18.04 LTS


### Update the server and install dependencies
```bash
sudo apt update
sudo apt install build-essential libgmp3-dev \
    libsodium-dev libboost-dev libboost-system1.65 \
    libboost-filesystem1.65 libboost-program-options1.65 \
    libboost-thread1.65 libdb5.3++ libminiupnpc10 \
    libevent-pthreads-2.1-6 libzmq5 -y
```

### Install the yyccoind server daemon
```bash
mkdir yyccoin .yyccoin
curl -o .yyccoin/yyccoin.conf https://raw.githubusercontent.com/yoloyachtclub/p2p-node-setup/master/yyccoin.conf
curl -o yyccoin/yyccoind https://raw.githubusercontent.com/yoloyachtclub/p2p-node-setup/master/yyccoind
curl -o yyccoin/yyccoin-cli https://raw.githubusercontent.com/yoloyachtclub/p2p-node-pool-setup/master/yyccoin-cli
chmod 755 yyccoin/*
```

### If using RPC, edit the yyccoin.conf file to set your RPC username and password that the pool will use
```bash
change line #3 YOUR_RPC_USERNAME to any username you choose
change line #4 YOUR_RPC_PASSWORD to any password you choose
```
