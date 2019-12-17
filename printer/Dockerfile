FROM ruby:2.5.3

COPY print.rb /print.rb

RUN gem install httparty

CMD bash -c "while true; do ruby print.rb && sleep 20; done"
