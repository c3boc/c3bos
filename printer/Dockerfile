FROM ruby:3

RUN gem install httparty
COPY print.rb /print.rb
COPY gnomus.bin /gnomus.bin

ENTRYPOINT ["ruby"]
CMD ["/print.rb"]
