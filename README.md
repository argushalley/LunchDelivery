[![Build Status](https://travis-ci.org/argushalley/LunchDelivery.svg?branch=master)](https://travis-ci.org/argushalley/LunchDelivery)

README

This README would normally document whatever steps are necessary to get the
application up and running.

## How to setup

### Bundle

First install gems.

```console
bundle install
```

Setup the app settings:

```console
  cp config/database.yml.example config/database.yml
```

Then execute the commands bellow to prepare your database:

```console
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

## How to run

After configuring the application in setup you can just run
```console
rails s
```
to run it locally. There is no need for any special configuration.


## How to test

The project uses rspec for testing, so to run it type the following:
<code>bundle exec rspec</code>
