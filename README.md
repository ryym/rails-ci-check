CircleCI で Rails のテストを実行しようとするとなぜか以下のエラーになってしまうので、その原因調査のために作ったリポジトリ。

<https://circleci.com/gh/ryym/rails-ci-check/4>

```bash
$ #!/bin/bash -eo pipefail
bundle exec rails test

Could not find concurrent-ruby-1.1.5 in any of the sources
Run `bundle install` to install missing gems.
Exited with code 1
```

もちろん`bundle install`は実行しているのに、`rails test`するとこのエラーになる。
既存プロジェクトの問題かと思っていたが、`rails new`しただけのこのリポジトリでも同じエラーが起きた。

`BUNDLE_PATH`を指定するとこのエラーが起きる。`bundle install`結果をキャッシュするためにパスを指定したい。

で試しにローカルで Docker 立ち上げて試してみると同じエラーになった。 CircleCI じゃなくて Docker 環境で起きる問題だった。
その後ググってたどり着いた Stackoverflow で以下のワークアラウンドを見つけ、試したところテストが通るようになった。

<https://stackoverflow.com/a/55202645/7222928>

commit: https://github.com/ryym/rails-ci-check/commit/e94dedaa07967b65a8a6c052bc1b4942de53a069
