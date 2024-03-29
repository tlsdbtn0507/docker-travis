FROM node:21 as builder

WORKDIR '/usr/src/app'

COPY package.json .

RUN npm i

COPY ./ ./

RUN npm run build

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html