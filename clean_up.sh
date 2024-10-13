
echo "Removing all containers..."
docker container rm -v -f "$DB_HOST"

echo "Removing all networks..."
docker network rm -f "$DB_NETWORK"