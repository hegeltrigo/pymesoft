FROM ruby:2.7.3-slim-buster
RUN mkdir -p /app
WORKDIR /app
# ARGS DEFINITION
ARG BUNDLER_VERSION
ARG POSTGRES_VERSION
ARG NODE_VERSION
# Common dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    imagemagick  \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Install Postgres Client
# Add PostgreSQL to sources list
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $POSTGRES_VERSION > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libpq-dev \
    postgresql-client-$POSTGRES_VERSION

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3
RUN gem install bundler:$BUNDLER_VERSION
# Install node and dependencies
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | /bin/bash -

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log
RUN npm install -g yarn


COPY Gemfile* /app/

COPY package.json yarn.lock /app/

COPY ./docker/compose/development/rails/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]