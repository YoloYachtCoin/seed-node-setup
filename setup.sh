#!/bin/bash
YYC_USER="yycoin"
YYC_HOME="/home/$YYC_USER"
YYC_BIN="$YYC_HOME/yycoin"
YYC_CONF="$YYC_HOME/.yyccoin"

apt update
sudo apt install -y \
	build-essential \
	libgmp3-dev \
	libsodium-dev \
	libboost-dev \
	libboost-system1.65 \
	libboost-filesystem1.65 \
	libboost-program-options1.65 \
	libboost-thread1.65 \
	libdb5.3++ \
	libminiupnpc10 \
	libevent-pthreads-2.1-6 \
	libzmq5 \
	unzip

# Create the YYC user and directories
useradd -m -s /bin/bash $YYC_USER
mkdir -p $YYC_HOME/{yycoin,.yyccoin}

# Download the linux yycoin binaries and config
curl -L -O -J https://yoloyachtclub.com/downloads/yyccoin-linux-v1.0.6.zip
curl -o $YYC_CONF/yyccoin.conf https://raw.githubusercontent.com/yoloyachtclub/p2p-node-setup/master/yyccoin.conf
unzip -d $YYC_BIN yyccoin-linux-v1.0.6.zip

# Fix up perms
chmod 755 /home/yycoin/yycoin/*
chown -R yycoin:yycoin /home/yycoin

# Configure the system
echo "Enabling firewall"
ufw allow ssh
ufw allow 4279
ufw --force enable
ufw status

echo "Enabling cron job for yycoind"
echo "* * * * * yycoin /home/yycoin/yycoind" > /etc/cron.hourly/yycoind


# Run the yycoin daemon
runuser -u $YYC_USER -- $YYC_BIN/yyccoind
