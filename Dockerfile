FROM ruby:2.5.1-slim

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
       postgresql-client \
       libgmp-dev \
       libpq-dev \
       build-essential \
       patch \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

# Configure the main working directory
ENV app /app
RUN mkdir $app
WORKDIR $app

# Set where to install gems
ENV GEM_HOME /rubygems
ENV BUNDLE_PATH /rubygems

# Having the bundle install in here isn't a good idea.
# Each command that runs in this dockerfile creates a snapshot.
# RUN bundle install

ADD . $app
