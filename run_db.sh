
echo "Starting database server..."

if [ "$RDBMS" = 'mysql' ]; then 
    ./mysql.sh
fi