FROM webdevops/apache:alpine


COPY startup-scripts/* /opt/docker/bin/service.d/httpd.d
COPY apache-conf/99-appdynamics_agent.conf.tmpl /opt/docker/etc/httpd/conf.d

#RUN apk update \
#    && apk add libc6-compat

#RUN apk --no-cache add ca-certificates wget \
#    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
#            https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub \
#    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.26-r0/glibc-2.26-r0.apk \
#    && apk add glibc-2.26-r0.apk \
RUN apk add libc6-compat --update-cache \
            --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
    && apk add libstdc++


EXPOSE 80 443

