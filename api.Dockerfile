FROM node:17-buster

WORKDIR /api

COPY ./digitala/scripts/local-api/package.json ./digitala/scripts/local-api/package-lock.json ./

RUN npm ci

EXPOSE 3000

COPY ./digitala/scripts/local-api .

CMD ["node", "index.js"]