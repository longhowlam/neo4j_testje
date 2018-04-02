sudo neo4j-admin import  --database retail2.db \
--nodes /var/lib/neo4j/import/movies.csv \
--nodes /var/lib/neo4j/import/actors.csv \
--relationships /var/lib/neo4j/import/roles.csv --delimiter ","

