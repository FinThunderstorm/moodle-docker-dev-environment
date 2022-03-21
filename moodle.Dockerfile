FROM moodlehq/moodle-php-apache:8.0
SHELL ["/bin/bash", "--login", "-c"]

WORKDIR /var/www

RUN apt update
RUN apt install -y nano

RUN git clone -b MOODLE_311_STABLE git://git.moodle.org/moodle.git html

WORKDIR /var/www/html

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

RUN nvm install && nvm use

# Edit basic Moodle Configuration file
COPY util/config.php config.php
COPY util/docker-php-moodle-filesizes.ini /usr/local/etc/php/conf.d/docker-php-moodle-filesizes.ini