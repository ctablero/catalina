#!/bin/sh

if [ "$DB_EXECUTION_TYPE" = "list" ]; then
  echo "Listing all migrations..."
  npx knex migrate:list
elif [ "$DB_EXECUTION_TYPE" = "migrate" ]; then
  echo "Running migrations..."
  npx knex migrate:latest
elif [ "$DB_EXECUTION_TYPE" = "rollback" ]; then 
  # Rollback the last migration batch.
  echo "Rolling back the last migration batch..."
  npx knex migrate:rollback
else
  echo "Unknown instruction type. Please use 'list', 'migrate', or 'rollback'."
  exit 1
fi