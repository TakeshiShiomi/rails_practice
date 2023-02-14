Rails.application.routes.draw do
  get 'accounts/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'accounts#new'
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

=begin
GETやその他のHTTPメソッドについて
HTTP（HyperText Transfer Protocol）には4つの基本的な操作があり、それぞれGET、POST、PATCH、DELETEという4つの動詞に対応づけられています。
クライアント（例えばFirefoxやSafariなどのWebブラウザ）とサーバー（ApacheやNginxなどのWebサーバー）は、上で述べた4つの基本操作を互いに認識できるようになっています
（ローカル環境でRailsアプリケーションを開発しているときは、クライアントとサーバーが同じコンピュータ上で動いていますが、一般的には、それぞれ別のコンピュータで動作しているという点を理解しておいてください）。
Railsを含む多くのWebフレームワークは、HTTPの各操作を発展させたRESTアーキテクチャの影響を受けています。

GETは最も頻繁に使われるHTTPリクエストで、主にWeb上のデータを読み取る（get）ときに使われます。
「ページを取得する（get a page）」という意味のとおり、ブラウザはhttps://www.google.com/やhttps://www.wikipedia.org/などのWebサイトを開くたびにGETリクエストをサイトに送信します。
POSTは、GETの次によく使用されるリクエストで、ページ上のフォームに入力した値を、ブラウザから送信する時に使われます。
例えばRailsアプリケーションでは、POSTリクエストは何かを作成するときによく使われます（なお本来のHTTPでは、POSTを更新に使ってもよいとしています）。
例えばユーザー登録フォームで新しいユーザーを作成するときは、POSTリクエストを送信します。
他にも、PATCHと DELETEという2つの操作があり、それぞれサーバー上の何かを更新したり削除したりするときに使われます。
これら2つの操作は、GETやPOSTほどは使われていません。これは、ブラウザがPATCHとDELETEをネイティブでは送信しないからです。
しかし、Ruby on Railsなどの多くのWebフレームワークは、ブラウザがこれらの操作のリクエストを送信しているかのように見せかける技術（偽装）を駆使して、PATCHとDELETEという操作を実現しています。
結果として、Railsはこの4つのHTTPリクエスト（GET・POST・PATCH・DELETE）を全てサポートできるようになりました。
=end
