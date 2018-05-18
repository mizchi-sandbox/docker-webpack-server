FROM node:8.11 as dev

WORKDIR /assets

# Setup tini to avoid PID 1
# See http://ngzm.hateblo.jp/entry/2017/08/22/185224
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# install
COPY ./webpack.config.js /assets/webpack.config.js
COPY ./serve.config.js /assets/serve.config.js
COPY ./package.json /assets/package.json
COPY ./yarn.lock /assets/yarn.lock
RUN yarn install

EXPOSE 8080 8081
CMD yarn start

FROM dev as builder
COPY ./src /assets/src
RUN yarn build:prod
CMD ["cp", "-r", "./dist", "/host"]

FROM nginx:1.14-alpine
COPY --from=builder /assets/dist /usr/share/nginx/html/
EXPOSE 80
