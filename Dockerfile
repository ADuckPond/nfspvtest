FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/* && mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak && sed 's/80;/8080;/g' /etc/nginx/conf.d/default.conf.bak > /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/
RUN useradd -g root web && chown -R web:root /usr/share/nginx /var && chmod -R 775 /usr/share/nginx /var

CMD ["nginx", "-g", "daemon off;"]