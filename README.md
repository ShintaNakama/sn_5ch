# README
## sn_5ch
- テストで作成した掲示板アプリ

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Version
  - ruby:2.6.5
  - rails:6.0.2
  - mysql:5.7
  - elasticsearch:7.5.1

* Database creation
```
$ docker-compose run rails bin/rails db:migrate
```

* How to run the test suite
```
$ docker-compose build
$ docker-compose up
```

* Services (job queues, cache servers, search engines, etc.)
- Create elasticsearch index
```
$ docker-compose run rails bin/rails elasticsearch:create_post_index
$ docker-compose run rails bin/rails elasticsearch:import_post
```
