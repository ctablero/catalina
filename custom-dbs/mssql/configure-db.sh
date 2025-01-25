#!/bin/bash

# Wait 60 seconds for SQL Server to start up by ensuring that 
# calling SQLCMD does not return an error code, which will ensure that sqlcmd is accessible
# https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-databases-transact-sql?view=sql-server-2017 

DBSTATUS=1
ERRCODE=1
i=0

while [[ $i -lt 60 ]] && [[ $ERRCODE -ne 0 ]]; do
	i=$((i+1))
	echo "*********Checking SQLCMD does not return an error code**********"
    DBSTATUS=$(/opt/mssql-tools18/bin/sqlcmd -h -1 -t 1 -No -U sa -P $MSSQL_SA_PASSWORD -Q "SET NOCOUNT ON; Select SUM(state) from sys.databases")
	ERRCODE=$?
	sleep 1
done

if [ $ERRCODE -ne 0 ]; then 
	echo "SQL Server took more than 60 seconds to start up"
	exit 1
fi

# Run the setup script to create the DB and the schema in the DB
/opt/mssql-tools18/bin/sqlcmd -S localhost -No -U sa -P $MSSQL_SA_PASSWORD -d master -i setup.sql
