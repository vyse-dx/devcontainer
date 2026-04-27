FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    curl \
    git \
    unzip \
    sudo \
    ca-certificates \
    nano \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:ondrej/php -y \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    php8.5-cli \
    php8.5-curl \
    php8.5-mbstring \
    php8.5-pgsql \
    php8.5-xml \
    php8.5-zip \
    php8.5-xdebug \
    php8.5-sqlite3 \
    watchman \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "ubuntu ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
    && chmod 0440 /etc/sudoers.d/ubuntu

USER ubuntu
WORKDIR /workspace

CMD ["sleep", "infinity"]
