FROM node:6.2

RUN apt-get install -y git

RUN npm install -g coffee-script iced-coffee-script

RUN mkdir /app
WORKDIR /app
# ADD . /app
# useful but a bit overkill during iterative development because it will re-run npm install every time
# if you're behind a firewall I suggest to use local modules as docker network bridge doesn't play with npm very well

ADD package.json /app
ADD package.json /tmp/package.json
RUN npm install

ADD config         /app
ADD contracts      /app
ADD compile.coffee /app
ADD contracts      /app/contracts
ADD config         /app/config
ADD coffeeify      /app
ADD compile        /app

RUN mkdir -p /datadir


VOLUME /datadir

EXPOSE 3000


RUN coffee -c -o dist compile.coffee
RUN ./compile

ADD app.coffee /app
RUN ./coffeeify



CMD npm start
