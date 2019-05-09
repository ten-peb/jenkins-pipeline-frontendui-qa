FROM ubuntu-nodejs-10:0.5.0
MAINTAINER Peter L. Berghold <pberghold@tenna.com>

EXPOSE 8081

WORKDIR /var/www/html

#RUN mkdir public 
#COPY ui/node_modules/ ./node_modules/
#COPY ui/src/ ./src/
#COPY ui/src/index.html ./public/
#COPY ui/server.js ./
COPY ui/ /var/www/html/

RUN npm install
RUN npm cache clean --force


# CMD ["node","server.js"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
