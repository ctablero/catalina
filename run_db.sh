
echo "Starting catalina db..."
docker run -d -p "$DB_HOST_PORT:$DB_INTERNAL_PORT" --name catalina_db "$DB_IMAGE_NAME:$DB_IMAGE_TAG"