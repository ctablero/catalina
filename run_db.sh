
echo "Starting catalina db..."
docker run -d -p $DB_HOST_PORT:3306 --name catalina_db $DB_IMAGE_NAME:$DB_IMAGE_TAG
docker container ls