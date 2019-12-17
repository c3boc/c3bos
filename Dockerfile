FROM ruby:2.5.3 AS builder
RUN apt update && apt install -y apt-transport-https lsb-release libpq5
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn
WORKDIR app
COPY . .
RUN cp config/database.yml.example config/database.yml && \
    cp config/secrets.yml.example config/secrets.yml
ARG RAILS_ENV=production
ARG SECRET_KEY_BASE=geheim
RUN bundle install
RUN yarn
RUN bundle exec rake webpacker:binstubs
RUN bundle exec rake webpacker:compile
ENV RAILS_LOG_TO_STDOUT=1
ENV RAILS_SERVE_STATIC_FILES=1
RUN cp config/database.yml.example config/database.yml && \
    cp config/secrets.yml.example config/secrets.yml

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]
