# Rails7 + PostgreSQL環境構築


①Gemfile, Gemfile.lock, Dockerfile,docker-compose.ymlファイルを作成する　　


②Gemfile, Dockerfile,docker-compose.ymlを編集する　　

＊備考

・NameError: uninitialized constant Gem::Sourceのエラーが出たため、Bundlerをアップデートするために、Dockerfileにgem update --systemおよびbundle update --bundlerを実行するように修正

・Rails 7ではWebpackerが標準では組み込まれなくなったので、yarnやnodejsのインストールが不要になった。　　


③docker compose run --rm web rails new . --force --database=postgresqlを実行　　


④database.ymlファイル設定編集。　　

*rails new を実行したことにより、 Gemfile が変更されるので、新しい gem をインストールするために、コンテナを再ビルドして起動。　　

docker compose build (docker compose up --build)　　

docker compose up　　


⑤データベースの作成　　

docker compose exec web rails db:create　　

railsが起動できる状態になる　　

参考サイト　　

https://zenn.dev/hs7/articles/2cc4d67650ba69　　

https://zenn.dev/lirais/articles/fe240a0c248783　　

https://docs.docker.jp/compose/rails.html?highlight=rails　　

https://qiita.com/croquette0212/items/7b99d9339fd773ddf20b　　

https://qiita.com/P-man_Brown/items/32fdba14e88219f8d2f0　　

https://qiita.com/P-man_Brown/items/32fdba14e88219f8d2f0　　

https://qiita.com/koyo-miyamura/items/5f1d123046917782e111　　

https://gist.github.com/kkmory/400a0faf95f2d3b2c7638b55fc0f4a9a

https://abillyz.com/watanabe/studies/244
