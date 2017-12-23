FROM starefossen/ruby-node:2-8 AS builder
RUN env
WORKDIR app
COPY . .
ARG RAILS_ENV=production
RUN bundle install
RUN yarn
RUN bundle exec rake webpacker:compile

FROM ruby:2.4.2-slim
ENV RAILS_LOG_TO_STDOUT=1
WORKDIR /app

RUN apt update && apt install -y libpq5

COPY . .
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/public/packs public/

RUN cp config/database.yml.example config/database.yml && \
    cp config/secrets.yml.example config/secrets.yml

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]
