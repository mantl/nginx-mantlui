FROM ciscocloud/nginx-consul:1.1
MAINTAINER Ryan Eschinger <ryanesc@gmail.com>

RUN mkdir -p /usr/share/nginx
COPY static /usr/share/nginx/html
