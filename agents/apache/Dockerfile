FROM webdevops/apache-dev:ubuntu-16.04


COPY startup-scripts/* /opt/docker/bin/service.d/httpd.d
COPY apache-conf/99-appdynamics_agent.conf.tmpl /opt/docker/etc/httpd/conf.d
    

EXPOSE 80 443

