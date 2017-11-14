FROM webdevops/apache:alpine


COPY startup-scripts/* /opt/docker/bin/service.d/httpd.d
COPY apache-conf/99-appdynamics_agent.conf.tmpl /opt/docker/etc/httpd/conf.d

RUN apk update \
    && apk add libc6-compat

EXPOSE 80 443

