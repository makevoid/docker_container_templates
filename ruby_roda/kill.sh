docker kill $(docker ps -a -q  --filter ancestor=ruby/roda --filter status=running)
