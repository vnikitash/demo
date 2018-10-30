FROM webdevops/php:7.2

COPY . /app
WORKDIR /app

RUN chmod -R 777 storage
RUN composer install
RUN cp .env.travis .env
RUN php artisan key:generate

ENV PATH="~/.composer/vendor/bin:./vendor/bin:${PATH}"