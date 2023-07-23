FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        git \
        zip \
    && docker-php-ext-install -j$(nproc) iconv mbstring mysqli

RUN apt-get update && apt-get install -y libpng-dev 
RUN apt-get install -y \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev

RUN docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir

RUN docker-php-ext-install gd    

RUN apt-get install -y libzip-dev && docker-php-ext-configure zip --with-libzip=/usr/include && docker-php-ext-install zip 


#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install nodejs, npm, npm-check-updates (necessary if webpack or gulp is installed in the project)
#RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
#RUN apt-get install -y nodejs
#RUN npm update --global npm
#RUN npm install -g npm-check-updates

# Install ioncube
RUN curl -o ioncube.tar.gz http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvvzf ioncube.tar.gz \
    && mv ioncube/ioncube_loader_lin_7.3.so `php-config --extension-dir` \
    && rm -Rf ioncube.tar.gz ioncube \
    && docker-php-ext-enable ioncube_loader_lin_7.3

# Replace php.ini
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

WORKDIR /var/www

USER www-data

EXPOSE 9000

CMD ["php-fpm"]