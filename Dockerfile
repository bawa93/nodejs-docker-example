FROM node:12-alpine

RUN mkdir /app
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json /app/
RUN npm install

RUN npm install -g pm2
# Or if you're using Yarn
# ADD package.json yarn.lock /app/
# RUN yarn install

COPY . /app/

#CMD [ "npm", "run", "start"]
CMD [ "pm2", "start", "server.js", "--no-daemon"]
