FROM ubuntu:xenial
# fork of kunstmaan/ethereum-geth

# ---
# nodejs
#
RUN apt-get update
RUN apt-get install -y curl rlwrap

RUN curl https://deb.nodesource.com/node_6.x/pool/main/n/nodejs/nodejs_6.2.0-1nodesource1~trusty1_amd64.deb > node.deb \
 && dpkg -i node.deb \
 && rm node.deb

RUN npm install -g pangyp\
 && ln -s $(which pangyp) $(dirname $(which pangyp))/node-gyp\
 && npm cache clear\
 && node-gyp configure || echo ""

ENV NODE_ENV production
#
# / nodejs
# --------------------

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y -qq upgrade && \
    apt-get -y -qq install software-properties-common && \
    add-apt-repository ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get -y -qq install geth solc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update

RUN apt-get install git -y

RUN npm i -g coffee-script solc web3
RUN npm i -g pm2

WORKDIR /app
ADD . /app

ADD package.json /tmp/package.json
RUN npm i
RUN ./coffee
RUN ./compile


RUN geth --password config/geth_password.txt account new
RUN geth account list

# RUN ./blockchain


# RUN ./blockchain
RUN pm2 start --interpreter bash ./blockchain --no-daemon 


# RUN sleep 4


EXPOSE 8545
EXPOSE 30303

# RUN whoami

RUN pm2 status
# RUN pm2 show blockchain
# RUN pm2 logs blockchain
RUN geth attach

CMD ./run_app.sh
