FROM tenna/nodejs:latest
MAINTAINER Peter L. Berghold <pberghold@tenna.com>

EXPOSE 8081

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./ui/ . 
COPY ./ui/package.json ./
COPY ./.env.sample ./.env
RUN npm install --silent

ENV PATH /usr/src/app/node_modules:.bin:$PATH
ENV NODE_ENV=development
ENV PORT=8081


COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
