#!/bin/bash

set -e

#configure data directory
if [ ! -e /data ]; then
  mkdir /data
fi

#stage installer
if [ -e /data/install.sh ]; then
  rm -f /data/install.sh
fi
wget -q -O /data/install.sh http://get.pocketmine.net/
chmod 755 /data/install.sh

#check if configuration file exists
if [ ! -e /data/server.properties ]; then
  cp /tmp/server.properties /data/server.properties
fi

#setup owner
chown -R minecraft:minecraft /data

#install pocketmine
sudo -E -u minecraft /data/install.sh -v development

#start pocketmine
exec sudo -E -u minecraft /data/start.sh
