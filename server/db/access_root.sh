DATABASE_NAME=postgres
USER=postgres
PASSWORD=`cat superuser_password`
PORT=5432

#echo `psql -h localhost -U $USER -d $DATABASE_NAME -p $PORT`
psql -h localhost -U $USER -d $DATABASE_NAME -p $PORT

#`psql -h localhost -U $USER -d $DATABASE_NAME -p $PORT`
#psql -h localhost -U postgres -d postgres -p 5432
