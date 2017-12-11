FROM ruby:2.4.2

WORKDIR app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]
