#Build de la app Angular
FROM node:20-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


#Servir la app con Nginx
FROM nginx:stable-alpine

# Angular genera /dist/<app>/browser/
COPY --from=build /app/dist/angular-conduit/browser/ /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://localhost/ || exit 1
