
echo "Starting catalina db..."
docker run -d -p 3306:3306 --name catalina_db mysql:latest
docker container ls