FROM tenna/nodejs:latest
MAINTAINER Peter L. Berghold <pberghold@tenna.com>

EXPOSE 8081

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./ui/ . 
COPY ./ui/package.json ./
#   COPY ./ui/.env  ./.env
RUN npm install --silent

ENV PATH /usr/src/app/node_modules:.bin:$PATH
ENV NODE_ENV=development
ENV PORT=8081

COPY host_function.sh /opt/puppetlabs/facter/facts.d/host_function.sh
RUN chmod 755 /opt/puppetlabs/facter/facts.d/host_function.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
