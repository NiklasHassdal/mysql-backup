#!/bin/sh
file_path="/backups/$(date "+${BACKUP_FILENAME}")"
if [[ ${file_path} == *.gz ]]; then
    mysqldump --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=${MYSQL_HOST} --skip-comments ${MYSQL_DATABASE} | gzip > ${file_path}
else
    mysqldump --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --host=${MYSQL_HOST} --skip-comments ${MYSQL_DATABASE} > ${file_path}
fi
if [ $? -eq 0 ]; then
    echo Backup file created: ${file_path}
fi