FROM ruby:3

RUN gem install httparty
COPY . .

ENTRYPOINT ["ruby"]
CMD ["/print.rb"]
