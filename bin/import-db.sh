#!/bin/bash

if [ "$(pwd | grep bin)" ]
then
	if [ ! -f ../database/latest.sql ]; then
    	echo "DB Backup file not found."
    	exit
	fi
	echo "Updating domain name from backup..."
	sed -i.bak 's|https://dev.bluebirdbotanicals.com|http://localhost:8000|g' ../database/latest.sql
	sed -i.bak 's|https://admin.bluebirdbotanicals.com|http://localhost:8000|g' ../database/latest.sql
	sed -i.bak 's|https://www.bluebird-botanicals.com|http://localhost:8000|g' ../database/latest.sql
	sed -i.bak 's|https://bluebird-botanicals.com|http://localhost:8000|g' ../database/latest.sql
	sed -i.bak 's|https://bluebirdbotanicals.com|http://localhost:8000|g' ../database/latest.sql
	sed -i.bak 's|https://bluebirdbotanicals.com|http://localhost:8000|g' ../database/latest.sql
	sed -i.bak 's|https://shop.bluebirdbotanicals.com|http://localhost:8000|g' ../database/latest.sql
	sleep 1
	echo "---------------------------------------"
	echo "Restoring database from backup..."
	mysql -u bluebird -pbluebird_ --host=127.0.0.1 --port=8009 bluebird < ../database/latest.sql
else
	if [ ! -f database/latest.sql ]; then
    	echo "DB Backup file not found."
    	exit
	fi
	echo "Updating domain name from backup..."
	sed -i.bak 's|https://dev.bluebirdbotanicals.com|http://localhost:8000|g' database/latest.sql
	sed -i.bak 's|https://admin.bluebirdbotanicals.com|http://localhost:8000|g' database/latest.sql
	sed -i.bak 's|https://www.bluebird-botanicals.com|http://localhost:8000|g' database/latest.sql
	sed -i.bak 's|https://bluebird-botanicals.com|http://localhost:8000|g' database/latest.sql
	sed -i.bak 's|https://bluebirdbotanicals.com|http://localhost:8000|g' database/latest.sql
	sed -i.bak 's|https://shop.bluebirdbotanicals.com|http://localhost:8000|g' database/latest.sql
	echo "---------------------------------------"
	echo "Restoring database from backup..."
	mysql -u root -pelmismo --host=127.0.0.1 --port=8009 bluebird < database/latest.sql
fi

echo "---------------------------------------"
echo "done."