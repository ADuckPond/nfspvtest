FROM nginx:latest

RUN apt-get update && apt-get install nginx && rm -rf /usr/share/nginx/html/*
COPY * /usr/share/nginx/html/
RUN useradd -g root web && chown -R web:root /usr/share/nginx/html && chmod -R 770 /usr/share/nginx/html

CMD ["nginx" "-g" "daemon off;"]