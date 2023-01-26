FROM	alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache nginx

EXPOSE	443

#RUN mkdir -p /etc/nginx/ssl && cp ./tools/rmonney.42.fr.crt /etc/nginx/ssl/ && \
#	cp ./tools/rmonney.42.fr.key /etc/nginx/ssl/

RUN mkdir -p /etc/nginx/ssl && \
	apk add openssl=1.1.1s-r0 && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/rmonney.42.fr.crt -keyout /etc/nginx/ssl/rmonney.42.fr.key \
	-subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=rmonney.42.fr/UID=rmonney"

RUN	mkdir -p /etc/nginx/wordpress

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
