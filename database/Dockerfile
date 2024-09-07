FROM postgres:16.4-bookworm
ADD . /chatapplication
WORKDIR /chatapplication
COPY createdb.sql /docker-entrypoint-initdb.d

