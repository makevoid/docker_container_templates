#sudo chown $USER:$USER $HOME/apps/ethereum-geth-dev-ipc-root/datadir/geth.ipc && \

docker build -t='ethereum/simplestorage' . && \

docker run -p 3000:3000 -v datadir:/datadir ethereum/simplestorage
