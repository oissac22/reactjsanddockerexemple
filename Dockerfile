FROM node:alpine as build

WORKDIR /app
COPY react/src /app/src
COPY react/public /app/public
COPY react/package.json /app/package.json
RUN npm install
RUN npm install react-scripts --save-dev
RUN npm run build

RUN rm -fr /app/src
RUN rm -fr /app/public
RUN rm -fr /app/node_modules
RUN rm -f /app/package.json




FROM nginx:alpine


EXPOSE 80

RUN mkdir /logs
RUN mkdir /etc/nginx/logs

WORKDIR /logs

RUN echo >error.log
RUN echo >nginx.pid
RUN echo >access.log

WORKDIR /etc/nginx/logs
RUN echo >error.log
# RUN echo >error.log

COPY nginx.conf /etc/nginx/

COPY --from=build /app/build /www