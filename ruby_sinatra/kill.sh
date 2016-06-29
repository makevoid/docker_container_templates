docker kill $(docker ps -a -q  --filter ancestor=ruby/sinatra --filter status=running)
