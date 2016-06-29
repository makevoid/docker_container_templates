docker kill $(docker ps -a -q  --filter ancestor=node/express --filter status=running)
