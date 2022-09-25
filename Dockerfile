FROM alpine:3.16
RUN apk update
RUN apk add mariadb-client
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=
ENV MYSQL_HOST=127.0.0.1
ENV MYSQL_PORT=3306
ENV BACKUP_FILENAME=%Y-%m-%d-%H.%M.%S.sql.gz
RUN mkdir /backups/
COPY ./backup.sh /root/backup.sh
RUN chmod 777 /root/backup.sh
CMD sh -c "echo \"${CRONTAB_EXPRESSION} /root/backup.sh\" | crontab -; crond -f"