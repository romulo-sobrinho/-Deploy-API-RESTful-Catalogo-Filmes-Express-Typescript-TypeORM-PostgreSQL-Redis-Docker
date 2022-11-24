FROM node:alpine

WORKDIR /home/node/app

COPY package*.json ./

RUN yarn

COPY . .

EXPOSE 3333

RUN yarn typeorm migration:run

CMD node dist/shared/http/server.js
