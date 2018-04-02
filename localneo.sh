######### A sample session with neo4j

######### start neo4j
sudo service neo4j start
sudo service neo4j status

######### start cypher shell

cypher-shell

######## import some data, located at /var/lib/neo4j

LOAD CSV FROM "file:///artists.csv" AS line
CREATE (:Artist { name: line[1], year: toInteger(line[2])});



CALL algo.pageRank('Product','PART_OF',
{iterations:5, dampingFactor:0.85, write: true, writeProperty:'pagerank'});


MATCH (n)
RETURN n;


MATCH (n)
DETACH DELETE n;

############### er mee stoppen

:exit

sudo service neo4j stop
