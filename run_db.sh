
echo "Starting database server..."
docker run -d -p "$DB_HOST_PORT:$DB_INTERNAL_PORT" --name "$DB_HOST" --network "$DB_NETWORK" -e MYSQL_ROOT_PASSWORD="$DB_PASSWORD" "$DB_IMAGE_NAME:$DB_IMAGE_TAG"