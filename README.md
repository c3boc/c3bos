# c3bos
[![CircleCI](https://circleci.com/gh/c3boc/c3bos/tree/master.svg?style=svg)](https://circleci.com/gh/c3boc/c3bos/tree/master)

CCC Bar Operation System

This System is used to coordinate Bar Deliveries, Bar Inventory and more Bar related Stuff at CCC Events


## Development

```
# prepare development environment
bundle install
cp config/database.yml{.example,}
docker-compose up -d
bundle exec rake db:setup

# start development environment
bundle exec foreman start
```
