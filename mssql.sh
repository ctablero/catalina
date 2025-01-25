echo "Starting mssql server..."
docker run -e 'ACCEPT_EULA=Y' -e MSSQL_SA_PASSWORD="$DB_PASSWORD" \
 -p "$DB_HOST_PORT":"$DB_INTERNAL_PORT" --name "$DB_HOST" \
 --network "$DB_NETWORK" -d "$DB_IMAGE_NAME":"$DB_IMAGE_TAG"
