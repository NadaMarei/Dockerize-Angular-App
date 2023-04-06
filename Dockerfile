# first-stage of building angular image 
FROM node:16.20.0-alpine3.16 AS build
RUN mkdir -p /app

WORKDIR /app
COPY package.json /app/
RUN npm install  

COPY . /app/
RUN npm run build --prod

#final stage
FROM nginx:alpine 
COPY --from=build /app/dist/helpdesk /user/share/nginx/html



