Oishinbo
====

[![Build Status](https://travis-ci.org/sota1235/Oishinbo.svg)](https://travis-ci.org/sota1235/Oishinbo) [![Coverage Status](https://coveralls.io/repos/sota1235/Oishinbo/badge.svg?branch=master&service=github)](https://coveralls.io/github/sota1235/Oishinbo?branch=master)

ランチマップをつくろう

### Description

社内の人と気軽にランチに行けるようなマップを作ります。

### Demo

### VS.

### Requirement

- Ruby 2.2.2
- Sinatra 1.4.6
- MySQL

### Usage

### Install

- Clone the repository

```
$ git clone git@github.com:sota1235/Oishinbo.git

$ cd Oishinbo

$ bundle install --path vendor/bundle
```

- Bower install

You need [bower](https://github.com/bower/bower).

```
$ npm install -g bower

$ bower install
```

- Build JS

JS files required browserify.

```shell
$ npm i

$ gulp
```

- Edit `.env`.

You can use `.env.example`!! Copy the file and edit it as `.env`.

```
$ cp .env.example .env

$ vim .env
```

- Migration

```
# Migration
$ bundle exec rake db:migrate:status
$ bundle exec rake db:migrate

# add seed data
$ bundle exec rake db:seed

# Confirmation
$ bundle exec rackup -o 0.0.0.0
```

Access `http://{localhost or IP}:9292/test`

### Contribution

### Licence

This software is released under the MIT License, see LICENSE.txt.

### Author

[@ktarow](https://github.com/ktarow)

[@YuyaAbo](https://github.com/YuyaAbo)

[@sota1235](https://github.com/sota1235)
