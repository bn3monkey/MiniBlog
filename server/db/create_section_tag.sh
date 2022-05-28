DATABASE_NAME=mini_blog
USER=bn3monkey
PASSWORD=`cat password`
PORT=5432

PGPASSWORD=$PASSWORD psql -h localhost -U ${USER} -d ${DATABASE_NAME} -p ${PORT} -a -f create_section_tag.sql