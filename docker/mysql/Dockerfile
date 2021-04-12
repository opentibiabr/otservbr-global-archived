FROM mariadb:10

# Everything inside docker-entrypoint-initdb.d will be executed
# in the first time that the container is generated
COPY schema.sql docker/data/test_account.sql /docker-entrypoint-initdb.d/
