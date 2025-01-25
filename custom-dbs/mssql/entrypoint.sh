#!/bin/bash

# Configurations for the database
/usr/config/configure-db.sh &

# Start the SQL server
/opt/mssql/bin/sqlservr
