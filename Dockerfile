FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/* && mv /etc/nginx/config.d/default.conf /etc/nginx/config.d/default.conf.bak && sed 's/80;/8080;/g' /etc/nginx/config.d/default.conf.bak > /etc/nginx/config.d/default.conf
COPY index.html /usr/share/nginx/html/
RUN useradd -g root web && chown -R web:root /usr/share/nginx/html /var/cache/nginx /var/log/nginx && chmod -R 775 /usr/share/nginx/html /var/cache/nginx /var/log/nginx

CMD ["nginx", "-g", "daemon off;"]