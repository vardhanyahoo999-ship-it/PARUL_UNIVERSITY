FROM php:8.2-apache

RUN a2enmod rewrite headers

WORKDIR /var/www/html
COPY . /var/www/html/

# Cache static files
RUN echo '<IfModule mod_headers.c>\n\
<FilesMatch "\\.(css|js|jpg|jpeg|png|gif|svg)$">\n\
Header set Cache-Control "max-age=31536000, public"\n\
</FilesMatch>\n\
</IfModule>' > /etc/apache2/conf-enabled/cache.conf

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
