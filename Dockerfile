# Use the official PHP 8.2 CLI image
FROM php:8.2-cli

# Install system packages and required PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libxml2-dev \
    && docker-php-ext-install xml \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Configure Xdebug for coverage
RUN echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/xdebug.ini

# Create a user with the same UID and GID as the host
ARG USER_ID
ARG GROUP_ID
RUN groupadd -g ${GROUP_ID} developer && \
    useradd -m -u ${USER_ID} -g developer developer

# Switch to the developer user
USER developer

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set the working directory
WORKDIR /app
