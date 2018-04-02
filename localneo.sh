######### A sample session with neo4j

######### start neo4j
sudo service neo4j start
sudo service neo4j status

sudo vi /etc/neo4j/neo4j.conf



######### start cypher shell

cypher-shell
neo4j
longhowneo
######## import some data, located at /var/lib/neo4j

LOAD CSV FROM "file:///artists.csv" AS line
CREATE (:Artist { name: line[1], year: toInteger(line[2])});

######### person,  movie.  roles voorbeeld
LOAD CSV WITH HEADERS FROM "file:///persons.csv" AS csvLine
CREATE (p:Person { id: toInteger(csvLine.id), name: csvLine.name });

CREATE INDEX ON :Country(name);

LOAD CSV WITH HEADERS FROM "file:///movies.csv" AS csvLine
MERGE (country:Country { name: csvLine.country })
CREATE (movie:Movie { id: toInteger(csvLine.id), title: csvLine.title, year:toInteger(csvLine.year)})
CREATE (movie)-[:MADE_IN]->(country)
;

USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM "file:///roles.csv" AS csvLine
MATCH (person:Person { id: toInteger(csvLine.personId)}),
  (movie:Movie { id: toInteger(csvLine.movieId)})
CREATE (person)-[:PLAYED { role: csvLine.role }]->(movie)
;

########## kortste pad voorbeelden
MATCH (start:Person{name:'Martin Sheen'}), (end:Person{name:'Michael Douglas'})
CALL algo.shortestPath.stream(start, end, 'cost')
YIELD nodeId, cost
RETURN nodeId, cost LIMIT 20
;

MATCH (start:Person{name:'Martin Sheen'}), (end:Person{name:'Morgan Freeman'})
CALL algo.shortestPath.stream(start, end, 'cost')
YIELD nodeId, cost
RETURN nodeId, cost LIMIT 20
;



CALL algo.pageRank('Product','PART_OF',
{iterations:5, dampingFactor:0.85, write: true, writeProperty:'pagerank'});


############### er mee stoppen

:exit

sudo service neo4j stop
