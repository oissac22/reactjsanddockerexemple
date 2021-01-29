docker rm -f nginxdev

docker build --tag nginx:dev .
docker run --name nginxdev -p 10101:80 -d nginx:dev

@echo off

docker ps

docker logs nginxdev