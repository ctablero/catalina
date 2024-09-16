# catalina
Automation of early tests for Knex migration and rollback during build time.

## How it works
1. A step creates a temporal empty slim DB which is accesible in other steps
2. A step is in charge of executing batches of knex migrations against the temporal slim DB
3. A step is in charge of executing batches of knex rollback agains the temporal slim DB  
