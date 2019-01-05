FROM node:latest

ARG GIT_BRANCH

#Cache bundle install
WORKDIR /tmp
ADD ./package.json package.json
RUN npm install

ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT
RUN git checkout $GIT_BRANCH

EXPOSE  8081
CMD ["node", "app.js"]
