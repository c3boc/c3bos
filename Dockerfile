FROM ruby:3

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development" \
    SECRET_KEY_BASE="geheim"

RUN apt-get update && apt-get install -y nodejs npm && corepack enable yarn

WORKDIR /rails

COPY . .

RUN bundle install

RUN node -v && yarn -v

RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

RUN cp config/database.yml.example config/database.yml && \
    cp config/secrets.yml.example config/secrets.yml

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]
