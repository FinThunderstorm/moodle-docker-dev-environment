FROM moodlehq/moodle-php-apache:8.0
SHELL ["/bin/bash", "--login", "-c"]
ARG MOODLE_VERSION=MOODLE_311_STABLE
ENV MOODLE_VERSION ${MOODLE_VERSION}


WORKDIR /var/www

RUN apt update
RUN apt install -y nano

RUN git clone -b ${MOODLE_VERSION} git://git.moodle.org/moodle.git html

WORKDIR /var/www/html

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

RUN nvm install && nvm use

RUN git clone https://github.com/andrewnicols/moodle-browser-config

# Edit basic Moodle Configuration file
COPY util/config.php config.php
COPY util/localprofiles.php /var/www/html/moodle-browser-config/localprofiles.php
COPY util/docker-php-moodle-filesizes.ini /usr/local/etc/php/conf.d/docker-php-moodle-filesizes.ini
COPY util/commands/grunta /usr/local/bin/grunta
COPY util/commands/install_grunt /usr/local/bin/install_grunt
COPY util/commands/install_moodle /usr/local/bin/install_moodle
COPY util/commands/init_phpunit /usr/local/bin/init_phpunit
COPY util/commands/init_behat /usr/local/bin/init_behat
COPY util/commands/phpunit /usr/local/bin/phpunit
COPY util/commands/behat /usr/local/bin/behat
COPY util/commands/upgrade /usr/local/bin/upgrade
COPY util/commands/install_all /usr/local/bin/install_all

WORKDIR /usr/local/bin
RUN chmod +x grunta
RUN chmod +x install_moodle
RUN chmod +x install_grunt
RUN chmod +x init_phpunit
RUN chmod +x init_behat
RUN chmod +x phpunit
RUN chmod +x behat
RUN chmod +x upgrade
RUN chmod +x install_all

WORKDIR /var/www/html
ENV PATH=$PATH:/root/.nvm/versions/node/v16.14.2/bin/
RUN install_grunt