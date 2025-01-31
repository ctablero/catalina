echo "Starting postgres server..."

docker run -e POSTGRES_PASSWORD="$DB_PASSWORD" -e POSTGRES_DB="$DB_NAME" \
    -p "$DB_HOST_PORT:$DB_INTERNAL_PORT" --name "$DB_HOST" \
    --network "$DB_NETWORK" -d "$DB_IMAGE_NAME:$DB_IMAGE_TAG"