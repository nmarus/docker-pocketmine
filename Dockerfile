#Minecraft PE Server
FROM ubuntu:trusty
MAINTAINER  Nicholas Marus <nmarus@gmail.com>

#Setup enviroment variables
ENV CNAME="pocketmine"

#Update container
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim sudo wget perl gcc g++ make automake libtool autoconf m4 gcc-multilib
RUN DEBIAN_FRONTEND=noninteractive apt-get clean

#Stage Files
COPY server.properties /tmp/server.properties
COPY start.sh /start.sh
RUN chmod 755 /start.sh

#Setup User
RUN useradd -d /data -s /bin/false --uid 1000 minecraft

#Setup container
EXPOSE 19132
VOLUME ["/data"]

#Start Pocketmine
WORKDIR /data
CMD ["/start.sh"]
