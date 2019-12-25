FROM jojons/ngx-admin-modules:starter AS deps
# jojons/ngx-admin-modules:[master/starter/0.1-...]
# FROM jojons/ngx-admin-modules:0.1 AS deps
# FROM node:10.18.0-buster AS deps
# WORKDIR /deps
# COPY ./package.json .
# RUN npm i -g npm@latest && npm install
# npm install -g npm && npm cache clean --force && npm cache verify &&

FROM angular/ngcontainer:0.10.0 AS base

EXPOSE 4200

WORKDIR /deps

COPY --from=deps /deps ./

VOLUME /app

WORKDIR /app

ENTRYPOINT true \
&& sudo ln -sf /deps/node_modules . \
&& sudo cp /deps/package-lock.json . \
&& ./node_modules/@angular/cli/bin/ng serve --host 0.0.0.0 --poll 1
