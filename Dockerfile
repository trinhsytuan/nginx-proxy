FROM nginx:alpine

COPY ssl/certs/* /etc/ssl/certs/
COPY ssl/private/* /etc/ssl/private/

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/* /etc/nginx/conf.d/