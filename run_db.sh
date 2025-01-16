
echo "Starting database server..."

if [ "$RDBMS" = 'mysql' ]; then 
    ./mysql.sh
elif [ "$RDBMS" = 'mssql' ]; then
    ./mssql.sh
else
    echo "Unknown RDBMS"
    exit 1
fi