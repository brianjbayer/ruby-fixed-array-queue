# Very simple single-stage Dockerfile with source code with
# default execution of the alpine (command-line) shell
# Warning: this image runs as root
FROM ruby:2.7.6-alpine

## Install Build Dependencies
# Use the same version of Bundler in the Gemfile.lock
ARG bundler_version=2.3.21
# Alpine needs build-base for building native extensions
RUN apk --update add --virtual build-dependencies build-base && gem install bundler:$bundler_version

## Copy the Source and Build the project
WORKDIR /app
COPY . /app/
RUN bundle _${bundler_version}_ install && bundle config --global frozen 1

# By default run the alpine shell
CMD sh
