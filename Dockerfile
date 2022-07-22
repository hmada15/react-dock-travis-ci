FROM node:alpine as node
WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=node /app/build /usr/share/nginx/html
