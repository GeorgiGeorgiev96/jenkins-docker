FROM httpd

RUN rm /var/www/html/index.html

COPY index.html /var/www/html/index.html

RUN service apache2 start

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
