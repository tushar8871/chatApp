FROM postgres:18.1-trixie
ADD . /chatapplication
WORKDIR /chatapplication
COPY createdb.sql /docker-entrypoint-initdb.d

