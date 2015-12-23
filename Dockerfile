FROM ciscocloud/nginx-consul:1.1
MAINTAINER Ryan Eschinger <ryanesc@gmail.com>

RUN mkdir -p /usr/share/nginx
COPY html /usr/share/nginx/html

COPY nginx.tmpl /consul-template/templates/
COPY consul.cfg /consul-template/config.d/
