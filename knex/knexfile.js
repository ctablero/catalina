const knex = require('knex')({
    client: process.env.DB_CLIENT,
    connectionString: process.env.DB_CONNECTION_STRING
});