FROM php:7.4-fpm

#Setup Environment
WORKDIR /var/www
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1

#Additional Server Dependencies
RUN apt-get -y -qq update
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    apt-utils \
    apt-transport-https \
    software-properties-common \
    imagemagick \
    libmagickwand-dev --no-install-recommends \
    ghostscript \
    libgraphicsmagick1-dev \
    libmagickcore-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libjpeg-dev \
    libxml2 \
    librsvg2-bin \
    libicu-dev \
    locales \
    jpegoptim optipng pngquant gifsicle \
    mcrypt \
    zip \
    zlib1g-dev \
    build-essential \
    logrotate \
    wget \
    sqlite3 \
    libsodium-dev \
    git \
    zsh \
    libcurl3-dev \
    curl \
    sqlite3 \
    libzip-dev \
    zip \
    unzip

RUN docker-php-ext-install soap zip intl bcmath pdo_mysql mysqli exif pcntl gd

RUN pecl channel-update pecl.php.net \
&& pecl install libsodium \
&& pecl install xdebug \
&& pecl install redis \
&& docker-php-ext-enable redis

#Composer
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php \
    php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

#Cleanup
RUN apt-get autoremove -y && apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/*

# Zsh and oh-my-zsh
ENV TERM xterm
ENV ZSH_THEME agnoster
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN PATH="$PATH:/usr/bin/zsh"

# Expose port 9000
EXPOSE 9000
