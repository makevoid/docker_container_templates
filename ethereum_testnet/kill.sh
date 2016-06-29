docker kill $(docker ps -a -q  --filter ancestor=ethereum/testnet --filter status=running)
