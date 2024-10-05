module.exports = {
    development: {
        client: 'mysql2',
        connection: {
            host: 'some_mysql_db',
            port: 3306,
            user: 'root',
            password: 'example_pass',
            database: 'testdb',
        },
    }
}