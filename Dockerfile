FROM ubuntu:latest
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir /var/www/
RUN mkdir /var/www/DiscordEarsBot
WORKDIR /var/www/DiscordEarsBot

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y git vim g++ cmake

RUN apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs 

RUN git clone https://github.com/danilinao/shpindel.git .
RUN npm install
RUN npm update
RUN npm install pm2@latest -g

CMD git pull && npm update && pm2-runtime start index.js
