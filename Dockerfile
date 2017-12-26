FROM starefossen/ruby-node:2-8 AS builder
RUN env
WORKDIR app
COPY . .
ARG RAILS_ENV=production
RUN bundle install
RUN yarn
RUN bundle exec rake webpacker:compile

FROM ruby:2.4.2-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
ENV RAILS_LOG_TO_STDOUT=1
WORKDIR /app

COPY . .
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/public/packs public/

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]
