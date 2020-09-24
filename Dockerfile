FROM node:12-alpine

RUN mkdir /var/www
WORKDIR /var/www

ENV PATH /var/www/node_modules/.bin:$PATH

COPY ./codebase/package.json /var/www/
RUN npm install

RUN npm install -g pm2
# Or if you're using Yarn
# ADD package.json yarn.lock /app/
# RUN yarn install

COPY ./codebase /var/www/

COPY ./config /config

#CMD [ "npm", "run", "start"]
CMD [ "pm2", "start", "/config/pm2.json", "--no-daemon"]
