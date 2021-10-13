FROM mysql:latest


ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

RUN mkdir /etc/certs
COPY /.configs/web-app-db/ca.pem /etc/certs/ca.pem
COPY /.configs/web-app-db/server-cert.pem /etc/certs/server-cert.pem
COPY /.configs/web-app-db/server-key.pem /etc/certs/server-key.pem
COPY /.configs/web-app-db/my.cnf /etc/mysql/my.cnf
CMD ["mysqld"]