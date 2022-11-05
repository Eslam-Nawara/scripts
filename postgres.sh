#!/bin/zsh

case $1 in
    'start')    docker start postgres;;
    'stop')     docker stop postgres;;
    'shell')    docker exec --user postgres -it postgres bash;;
    'create') 
        docker run -d --name "postgres" \
            -e POSTGRES_PASSWORD="secret" \
            -e POSTGRES_USER="postgres" \
            -p 5432:5432 \
            -v postgres-default:/var/lib/postgresql/data \
            -v ~/Desktop/sql-scripts:/sql-scripts \
            postgres:alpine;;
esac

