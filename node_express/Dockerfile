FROM node:6.2

RUN apt-get install -y git

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN npm install
CMD npm start
