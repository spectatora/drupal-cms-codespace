FROM devwithlando/php:8.3-fpm-5

# Set the SQLite version
ARG SQLITE_VERSION=3.45.1

# Update package list and install SQLite
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    && docker-php-ext-install pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*

# Verify installations
RUN php -v && sqlite3 --version

# Install Composer
RUN echo "Installing Composer" \
    && wget https://getcomposer.org/installer \
    && php installer --install-dir=/usr/local/bin --filename=composer \
    && rm installer

# Install global Drush launcher
RUN echo "Installing global Drush launcher" \
    && wget -O /usr/local/bin/drush https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar \
    && chmod +x /usr/local/bin/drush

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && \
    sed -i \
    -e 's/^max_input_vars.*/max_input_vars = 2000/' \
    -e 's/^memory_limit.*/memory_limit = 512M/' \
    -e 's/^post_max_size.*/post_max_size = 512M/' \
    -e 's/^upload_max_filesize.*/upload_max_filesize = 32M/' \
    /usr/local/etc/php/php.ini

# Create a user
RUN echo "Creating a user" \
    && useradd -m drupal -p drupal

USER drupal
ENV SHELL /bin/bash
