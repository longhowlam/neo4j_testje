#####################################################################
# using docker to test neo4j, see also http://kvangundy.com/wp/set-up-neo4j-and-docker/


sudo docker pull neo4j

sudo docker images
sudo docker ps -a
sudo docker rm neo4j
sudo docker kill neo4j

# remove all stopped images
sudo docker rm $(sudo docker ps -a -q)

sudo netstat -plnt
sudo kill -15 1551

##### starting neo4j with webbrowser and mapping to host volumes
sudo docker run \
  --name neo4j \
  --publish=7474:7474 --publish=7687:7687 \
  --volume=$HOME/neo4j/data:/data \
  --volume=$HOME/neo4j/import:/var/lib/neo4j/import \
  neo4j


#### neo4j shell trough cycli, local host tool to connect to running neo4j

sudo pip install cycli
cycli -u neo4j

MATCH (tom {name: "Tom Hanks"}) RETURN tom;

  
## neo4j shell, start the shell from a running neo4j docjer container
sudo docker exec --interactive --tty neo4j bin/cypher-shell
#neo4j
#longhowneo
MATCH p=()-[r:WROTE]->() RETURN p LIMIT 25;
MATCH (tom {name: "Tom Hanks"}) RETURN tom;


### import with load CSV tool in cypher shell
## data set CSV needs to be on the host in $HOME/neo4j/import
LOAD CSV WITH HEADERS FROM "file:///persons.csv" AS csvLine
CREATE (p:PersonQQ {id: toInt(csvLine.id), name: csvLine.name})
;

########### artiesten voorbeeld
## artists
LOAD CSV FROM 'file:///artists.csv' AS line
CREATE (:Artist { name: line[1], year: toInteger(line[2])});

## relationships
LOAD CSV WITH HEADERS FROM "file:///artistsrel.csv" AS edges
MATCH (a:Artist { Artist: edges.source})
MATCH (b:Artist { Artist: edges.target })
CREATE (a)-[:HAS_FRIEND]->(b);


:exit









