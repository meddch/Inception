FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache nginx

RUN apk update && apk upgrade && apk add wget nginx

RUN  mkdir -p /var/www/html

COPY ./tools/resume /var/www/html

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]