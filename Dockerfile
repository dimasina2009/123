FROM ubuntu:bionic
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y apache2
RUN echo 'hw' > /var/www/html/index.html
EXPOSE 88
CMD apachectl -D FOREGROUND
