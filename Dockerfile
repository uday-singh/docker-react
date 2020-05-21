FROM node:alpine
WORKDIR '/apps'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /apps/build /usr/share/nginx/html
