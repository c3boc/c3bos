FROM ruby:2.6.5

RUN gem install httparty
COPY print.rb /print.rb
COPY gnomus.bin /gnomus.bin


CMD ruby print.rb
