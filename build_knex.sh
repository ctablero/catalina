echo "Starting build..."

docker build --build-arg DB_CLIENT="$DB_CLIENT" -t "$KNEX_IMAGE_NAME:$KNEX_IMAGE_TAG" ./knex

echo "Build complete!"