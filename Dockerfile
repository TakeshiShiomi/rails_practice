FROM ruby:3.2.0
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    vim
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem update --system && gem install bundler \
    && bundle config set force_ruby_platform true \
    && bundle install
ADD . /myapp

# Rails7ではWebpackerが標準では組み込まれなくなったので、yarnやnodejsのインストールが不要
# Docker Instructionメモ
# FROM：使用するイメージ、バージョン
# RUN：任意のコマンド実行
# RUNコマンドを複数行実行することでイメージOS上の環境を整えていくことが可能だが、RUNごとにレイヤーが作られる
# レイヤーが増えるとイメージが大きくなるので注意
# レイヤーを作るコマンドRUN, COPY, ADDを複数使う必要がある場合は&&でコマンドをつなげて記述する
# 1行が長くなるとDockerfileが見辛くなるので(バックスラッシュ)で改行
# WORKDIR：作業ディレクトリを指定
# COPY：コピー元とコピー先を指定,  今回はローカルのGemfileをコンテナ内の/app/Gemfileに
# CMD:コンテナ実行時、デフォルトで実行したいコマンド
