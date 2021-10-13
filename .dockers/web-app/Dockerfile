FROM alpine:3.13

# Install packages and remove default server definition
RUN apk --no-cache add php8 php8-fpm php8-opcache php8-mysqli php8-json php8-openssl php8-curl php8-zip \
    php8-zlib php8-xml php8-phar php8-intl php8-fileinfo php8-dom php8-xmlreader php8-xmlwriter php8-tokenizer php8-ctype php8-session \
    php8-mbstring php8-gd nginx supervisor curl php8-pdo php8-pdo_mysql

# Remove default nginx config file (replaced by ours later on)

RUN rm /etc/nginx/conf.d/default.conf

# Configure nginx
COPY /.configs/web-app/nginx.conf /etc/nginx/nginx.conf

# Configure PHP-FPM
COPY /.configs/web-app/fpm-pool.conf /etc/php8/php-fpm.d/www.conf
COPY /.configs/web-app/php.ini /etc/php8/conf.d/custom.ini

# Configure supervisord
COPY /.configs/web-app/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Setup document root
RUN mkdir -p /var/www/

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /var/www/ && \
  chown -R nobody.nobody /run && \
  chown -R nobody.nobody /var/lib/nginx && \
  chown -R nobody.nobody /var/log/nginx

# Run composer if needed (for laravel/lumen/etc..)

#RUN ln -s /usr/bin/php8 /usr/bin/php
#WORKDIR /var/www
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

# Switch to use a non-root user from here on

USER nobody

# Add application

#COPY /.apps/web-app/* /var/www/

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]