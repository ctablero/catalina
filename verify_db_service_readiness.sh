# Netcat loop to wait to the database port to be receiving connections
until docker run --rm --network "$DB_NETWORK" alpine:3.20.0 sh -c "nc -zv -w30 $DB_HOST $DB_INTERNAL_PORT"
do
    ATTEMPTS_COUNTER=$(($ATTEMPTS_COUNTER + 1))
    if [ "$ATTEMPTS_COUNTER" -gt "$ATTEMPTS_LIMIT" ]; 
    then
        echo "Unable to connect to the database service port after several attempts, migrations cannot be executed!"
        exit 1
    fi
    echo "The port of the database service is not ready yet, trying one more time..."
    sleep 10
done

echo "Connection attempt to the database port succeeded!"