FROM nginx AS build

WORKDIR /app 

RUN apt update

RUN apt install mkdocs -y  && \
	apt install mkdocs-bootstrap -y 


COPY . .

RUN mkdocs build

FROM nginx:alpine

COPY --from=build /app/site  /usr/share/nginx/html


