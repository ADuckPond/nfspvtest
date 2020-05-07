FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/
RUN useradd -g root web && chown -R web:root /usr/share/nginx/html /var/cache/nginx && chmod -R 775 /usr/share/nginx/html /var/cache/nginx

CMD ["nginx", "-g", "daemon off;"]