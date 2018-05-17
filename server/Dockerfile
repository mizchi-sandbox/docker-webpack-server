FROM node:8.11.1

WORKDIR /server

# Setup tini to avoid PID 1
# See http://ngzm.hateblo.jp/entry/2017/08/22/185224
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

COPY ./package.json /server/package.json
COPY ./yarn.lock /server/yarn.lock
COPY ./index.js /server/index.js

RUN yarn install

EXPOSE 9000
CMD ["yarn", "start"]
