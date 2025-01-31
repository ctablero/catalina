
echo "Starting database server..."

if [ "$RDBMS" = 'mysql' ]; then 
    ./mysql.sh
elif [ "$RDBMS" = 'mssql' ]; then
    ./mssql.sh
elif [ "$RDBMS" = 'postgres' ]; then
    ./postgres.sh
else
    echo "Unknown RDBMS"
    exit 1
fi