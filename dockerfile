FROM mysql:5.7
COPY ./database/ /docker-entrypoint-initdb.d/