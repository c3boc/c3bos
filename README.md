# c3bos
[![CircleCI](https://circleci.com/gh/c3boc/c3bos/tree/master.svg?style=svg)](https://circleci.com/gh/c3boc/c3bos/tree/master)

CCC Bar Operation System

This System is used to coordinate Bar Deliveries, Bar Inventory and more Bar related Stuff at CCC Events

## Development setup

- Install Postgres

To use database.yml.example as is:

```sh
createuser -dP c3bos_development
# Enter "c3bos_development" as password
createuser -dP c3bos_test
# Enter "c3bos_test" as password
```

```sh
cp config/secrets.yml.example config/secrets.yml
cp config/database.yml.example config/database.yml
```

```sh
bundle
yarn
rails db:setup
rails runner "User.create(username: 'admin', password: 'admin', role: 2)"
rails s
```