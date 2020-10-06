FROM wordpress:php7.4

COPY favicon.ico /usr/src/wordpress

COPY php.ini /usr/local/etc/php/php.ini

RUN apt-get update; apt-get install unzip; apt-get clean all

WORKDIR /usr/src/wordpress/wp-content/plugins

RUN rm -rf /usr/src/wordpress/wp-content/plugins/*

ADD https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.2.4.1.zip .
ADD https://downloads.wordpress.org/plugin/wp-mail-smtp.2.2.1.zip .

RUN for i in *.zip; do unzip -o $i; rm $i; done

WORKDIR /usr/src/wordpress/wp-content/themes

RUN rm -rf /usr/src/wordpress/wp-content/themes/*

ADD https://downloads.wordpress.org/theme/monospace.1.91.zip .

RUN for i in *.zip; do unzip -o $i; rm $i; done

WORKDIR /var/www/html/
