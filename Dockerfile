# FROM openapitools/openapi-generator-cli:v5.3.0 AS build



FROM node:14.5.0-alpine3.12
RUN apk add openjdk11

WORKDIR /openapi

COPY package-lock.json .
COPY package.json .

RUN npm ci

COPY tsconfig.json .

CMD npm run generate && npm run build
