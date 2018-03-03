############################################################
# using docker to test neo4j
sudo docker pull neo4j

sudo docker images

sudo docker ps -a

sudo docker rm neo4j
sudo docker kill neo4j

# remove all stopped images
sudo docker rm $(sudo docker ps -a -q)

sudo netstat -plnt

sudo kill -15 1551

## starting neo4j with webbrowser
sudo docker run \
  --name neo4j \
  --publish=7474:7474 --publish=7687:7687 \
  --volume=$HOME/neo4j/data:/data \
  neo4j

#### neo4j shell trough cycli

sudo pip install cycli
cycli -u neo4j

MATCH (tom {name: "Tom Hanks"}) RETURN tom;

  
## neo4j shell
sudo docker exec --interactive --tty neo4j bin/cypher-shell


##########################################################################################


##### normal install 
sudo apt-get install neo4j

sudo iptables -I INPUT 1 -i eth0 -p tcp --dport 7474 -j ACCEPT
sudo service neo4j start
sudo service neo4j status


