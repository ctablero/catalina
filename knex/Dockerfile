FROM node:alpine

ARG DB_CLIENT

WORKDIR /app

RUN npm install knex ${DB_CLIENT}

COPY ./knexfile.js .

CMD [ "npx", "knex", "migrate:latest" ]