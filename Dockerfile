FROM alpine:latest

RUN apk add --update nginx && \
	mkdir -p /tmp/nginx/client-body && \
	rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/usr/share/nginx/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx", "-g", "daemon off;"]