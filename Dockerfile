FROM node:12-alpine


ARG APP_CODE_PATH_HOST=./codebase
ARG APP_CODE_PATH_CONTAINER=/var/www

RUN mkdir ${APP_CODE_PATH_CONTAINER}
WORKDIR ${APP_CODE_PATH_CONTAINER}

ENV PATH ${APP_CODE_PATH_CONTAINER}/node_modules/.bin:$PATH

COPY ${APP_CODE_PATH_HOST}/package.json ${APP_CODE_PATH_CONTAINER}/
RUN npm install

RUN npm install -g pm2
# Or if you're using Yarn
# ADD package.json yarn.lock /app/
# RUN yarn install

COPY ${APP_CODE_PATH_HOST} ${APP_CODE_PATH_CONTAINER}/

COPY ./config /config
#CMD [ "npm", "run", "start"]

ENTRYPOINT [ "sh", "/config/entrypoint.sh"]
CMD tail -f /dev/null