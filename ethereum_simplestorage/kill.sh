docker kill $(docker ps -a -q  --filter ancestor=ethereum/simplestorage --filter status=running)
