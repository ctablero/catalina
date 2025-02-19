module.exports = {
    development: {
        client: process.env.DB_CLIENT,
        connection: {
            host: process.env.DB_HOST,
            port: parseInt(process.env.DB_HOST_PORT),
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_NAME,
        },
    }
}