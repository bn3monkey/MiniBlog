NAME=postgres
USER=postgres
PASSWORD=postgres
PORT=5432

psql -h localhost -U $USER -d $NAME -p $PORT -a -f mini_blog.sql