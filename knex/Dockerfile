FROM node:alpine

ARG DB_LIBRARY

WORKDIR /app

RUN npm install knex ${DB_LIBRARY}

COPY . .

ENTRYPOINT [ "/app/entrypoint.sh" ]