# catalina
Automation of early tests for Knex migration and rollback during build time.

## How it works
1. A step creates a temporal DB which is accesible in other steps
2. A step is in charge of executing batches of knex migrations against the temporal DB
3. A step is in charge of executing batches of knex rollback agains the temporal DB

## Knex container

We are building a simple knex implementation on top of node alpine. In here we install dependencies, copy required files and execute the migration, simple as that.

### Build the knex image from the Dockerfile

<pre>
docker build --build-arg DB_CLIENT=db-client -t knex:my-tag . 
</pre>

Where DB_CLIENT can be any client recommended in the knex documentation, eg. mysql2, pg, etc

### Run the knex container

<pre>
docker container run --name knex_migration_tool --network=database_network --env-file=.env --rm knex:latest
</pre>