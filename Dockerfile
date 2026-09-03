FROM php:7.2-apache

# Set up directories in advance so we can control the permissions
RUN mkdir -p /usr/app

# Set the work directory
WORKDIR /usr/app

## Dependencies are handled in their own layer so that we can leverage layer cache and save time on rebuild


# Copy over application files
COPY --chown=apache:apache . .

# Set ARGs and ENV vars
ARG BUILD_VERSION
ARG ENV

ENV ENV=${ENV}
ENV BUILD_VERSION=${BUILD_VERSION}