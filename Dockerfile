FROM ubuntu

RUN apt-get update

env TZ=Europe/Sofia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install

RUN apt-get install -y tzdata

RUN apt install apache2 -y

RUN rm /var/www/html/index.html

COPY index.html /var/www/html/index.html
COPY prepros-6.config /var/www/html/prepros-6.config
COPY assets/  /var/www/html/assets/

RUN service apache2 start

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
