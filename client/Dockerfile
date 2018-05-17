FROM node:8.11.1

WORKDIR /app

# Setup tini to avoid PID 1
# See http://ngzm.hateblo.jp/entry/2017/08/22/185224
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Copy files
COPY ./webpack.config.js /app/webpack.config.js
COPY ./package.json /app/package.json
COPY ./yarn.lock /app/yarn.lock
COPY ./src /app/src

RUN yarn install
RUN yarn build:prod

EXPOSE 8080
EXPOSE 8081
CMD ["yarn", "watch"]
