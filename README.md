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

### 内容
- DB.tables
  - users(会員)
    - name
    - email
    - password
  - posts(投稿)
    - title
    - body
    - user_id(FK)
  - comments(レス)
    - comment
    - user_id(FK)
    - post_id(FK)
  - categories(カテゴリ)
    - category_name
  - posts_categories
    - post_id(FK)
    - cagegory_id(FK)

- userのログイン機能は、deviseを使いました。サインアップ時に名前の登録も行います。
- 投稿はログインしていないと出来ないようにしました。userとpostは1対多の関連になっています。
- 投稿時にカテゴリも登録します。カテゴリは複数登録が可能です。新しいカテゴリが入力された場合は、categories.tableにinsertし、すでに登録されている場合はcategories.tableへのinsertは行いません。postとcategoryは多対多の関連なのでposts_categories.tableで管理しています。
- 投稿に対してコメントが出来ます。
- 全文検索でelasticsearchを使い、タイトル、投稿内容、カテゴリ、コメントで検索出来ます。

#### TODO
- フロントエンド
- test
- Dockerfileのリファクタリング
- elasticsearchのindex更新が自動ではない
- 構成図などの作成
- etc
