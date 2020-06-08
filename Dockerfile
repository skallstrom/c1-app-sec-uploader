FROM php:7.2-apache

EXPOSE 80

COPY wp /var/www/html/
COPY main.sh /main.sh
RUN chmod +x /main.sh

RUN rm -rf /var/www/index.html

COPY config.yml /var/www/html/config.yml
COPY config.php /var/www/html/config.php

COPY ./trend_app_protect/trend_app_protect.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/
COPY trend_app_protect.ini /usr/local/etc/php/conf.d

ENTRYPOINT ["/main.sh"]

CMD ["default"]
