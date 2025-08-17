echo "Executing Knex container..."

docker container run --name "$KNEX_CONTAINER_NAME" --network "$DB_NETWORK" --env-file=.env --rm "$KNEX_IMAGE_NAME":"$KNEX_IMAGE_TAG"

echo "Knex executed successfully!"