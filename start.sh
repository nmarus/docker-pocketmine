#!/bin/bash

set -e

# stage installer
if [ -e /data/install.sh ]; then
  rm -f /data/install.sh
fi

wget -q -O /data/install.sh https://get.pocketmine.net/
chmod 755 /data/install.sh

# check if configuration file exists
if [ ! -e /data/server.properties ]; then
  cp /tmp/server.properties /data/server.properties
fi

# setup owner
chown -R minecraft:minecraft /data

# install pocketmine
sudo -E -u minecraft ./install.sh -v development

# start pocketmine
exec sudo -E -u minecraft PHP_BINARY=/data/bin/php5/bin/php ./start.sh