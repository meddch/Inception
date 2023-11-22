FROM alpine:3.17

RUN	apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 443

ENTRYPOINT [ "nginx" ]

CMD ["-g", "daemon off;"]
