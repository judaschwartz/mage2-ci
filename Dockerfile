FROM composer:1.8 as build

COPY app/ /app/
RUN composer install --no-interaction --no-progress --optimize-autoloader
WORKDIR /app/

FROM php:7.3-alpine3.8
ENV PATH "$PATH:/app/vendor/bin/"
COPY --from=build /app/ /app/

WORKDIR /code/
# Build arguments
ARG BUILD_DATE
ARG BUILD_REF

