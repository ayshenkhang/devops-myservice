FROM nginx:alpine

RUN adduser -u 1000 -D myuser

COPY html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/myservice /var/cache/nginx /var/run \
    && chown -R myuser:myuser /var/log/myservice /var/cache/nginx /var/run

USER myuser

EXPOSE 5000

HEALTHCHECK CMD curl -f http://localhost:5000 || exit 1

CMD ["nginx", "-g", "daemon off;"]
