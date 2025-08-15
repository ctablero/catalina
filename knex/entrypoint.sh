#!/bin/sh

echo "The execution type is : $DB_EXECUTION_TYPE"

# Execute migrations
npx knex migrate:latest