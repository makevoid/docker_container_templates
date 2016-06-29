FROM node:6.2

RUN apt-get install -y git

RUN mkdir /app
WORKDIR /app

ADD package.json /app
ADD package.json /tmp/package.json
RUN npm install

ADD *.coffee /app
ADD coffeeify /app
RUN ./coffeeify

ADD config /app
ADD contracts /app


EXPOSE 3000

CMD npm start
