#!/bin/bash

# get the current date in the format YYYYMMDD

CURRENT_DATE=$(date '+%Y%m%d')

# create the dir in /tmp with current date

mkdir -p "/tmp/$CURRENT_DATE"

cd "/tmp/$CURRENT_DATE" || exit

# execute a backup on all databases

mysqldump --all-databases --user=root --password='Njg5NS1qYWhtZWU3' > all-database-backup.sql

# move the file all-database-backup.sql

mkdir -p "/tmp/mysqldumps/$CURRENT_DATE"

mv "/tmp/$CURRENT_DATE/all-database-backup.sql"  "/tmp/mysqldumps/$CURRENT_DATE"/

# check to see backup was successful
if [ $? -eq 0 ]; then
    echo "Backup was successful."
else
    echo "Backup failed"
fi
