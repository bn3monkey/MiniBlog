DATABASE_NAME=mini_blog
USER=bn3monkey
PASSWORD=`cat password`
PORT=5432

npm install connect-pg-simple --save
PGPASSWORD=$PASSWORD psql -h localhost -U $USER -d $DATABASE_NAME -p $PORT -a -f node_modules/connect-pg-simple/table.sql