FROM centos

RUN yum install httpd -y

COPY beryllium /var/www/html
CMD apachectl -DFOREGROUND 