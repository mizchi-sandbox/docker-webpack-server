FROM node:8.11.1

RUN mkdir -p /client
WORKDIR /client

# Setup tini to avoid PID 1
# See http://ngzm.hateblo.jp/entry/2017/08/22/185224
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

COPY ./webpack.config.js /client/webpack.config.js
COPY ./serve.config.js /client/serve.config.js
COPY ./package.json /client/package.json
COPY ./yarn.lock /client/yarn.lock
COPY ./src /client/src

RUN yarn install

EXPOSE 8080 8081
