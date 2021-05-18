# YYC Peer to Peer Node Setup Guide

Requirements:
1. Ubuntu server 18.04 LTS

### Run setup.sh as root
```bash
chmod 700 setup.sh
./setup.sh
```

### Viewing logs
```bash
tail -f /home/yycoin/.yyccoin/debug.log
```

### Add your seed node to the source code

1. Fork https://github.com/YoloYachtCoin/YoloYachtCoin
2. Clone your fork
3. Add your IP and port to contrib/seeds/nodes_main.txt
4. Commit your changes
5. Create a pull request to merge your changes to the main git repo
6. Profit!
