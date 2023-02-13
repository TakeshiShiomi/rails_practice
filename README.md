# Railsの演習
①演習1
・scaffoldでuser,postテーブル作成
・userとpostの紐付け及びuser側にpostを表示。https://qiita.com/bitarx/items/a07c15e39ab1382396d4 参照。
・一部バリデーション実装

知識として
・UserモデルとPostモデルはいずれも、ApplicationRecordというクラスを継承している。（Rubyでは継承関係を<記号で表現）。また、ApplicationRecordクラスは、Active Recordが提供する基本クラス ActiveRecord::Baseを継承。
・コントローラーも同様でいずれもApplicationControllerを継承。ApplicationControllerがActionController::Baseクラスを継承。
・モデルの継承関係と同様に、UsersコントローラもMicropostsコントローラも最終的にはActionController::Baseという基本クラスを継承しています。このため、どちらのコントローラもモデルオブジェクトの操作や、送られてくるHTTP requestのフィルタリング、ビューをHTMLとして出力するなどの多彩な機能を実行できるようになっています。Railsのコントローラは必ずApplicationControllerを継承しているので、Applicationコントローラで定義したルールは、アプリケーションのすべてのアクションに反映されます。例えば9.1では、ログインとログアウト用のヘルパーメソッドをサンプルアプリケーションのすべてのコントローラで利用できるようにしています。

演習②
・コントローラ作成
・テスト駆動開発
・重複を取り除く１つビューで埋め込みRuby

知識
・どれほど十分に気を付けていたとしても、Railsアプリケーションの開発中に何か失敗してしまうことはありえます。ありがたいことに、Railsにはそのような失敗をカバーする機能がいくつもあります。
一般的なシナリオの1つは、生成したコードを元に戻したい場合です。例えばコントローラを生成した後で、もっといいコントローラ名を思い付き、生成したコードを削除したくなった場合などです。Railsはコントローラ以外にも関連ファイルを大量に生成するので、生成されたコントローラファイルを削除するだけでは元に戻りません。自動生成されたコードを元に戻すためには、新規作成されたファイルを削除するだけではなく、既存のファイルに挿入されたコードも削除する必要があります（rails generateを実行するとroutes.rbファイルも自動的に変更されるので、これも元に戻さなくてはなりません）。このようなときは、「generate」という言葉に因んで、rails destroyというコマンドを実行することで元に戻すことができます。例えば次の2つのコマンドは、自動生成と、それに対応する取り消し処理の例です。

  $ rails generate controller StaticPages home help
  $ rails destroy  controller StaticPages home help

モデルの自動生成についても、同様の方法で元に戻すことができます。
  $ rails generate model User name:string email:string
  $ rails destroy model User

マイグレーションの変更を元に戻す方法も用意されています。まずdb:migrateでデータベースのマイグレーションを変更します。
  $ rails db:migrate
元に戻したいときは、db:rollbackで1つ前の状態に戻します。
  $ rails db:rollback
最初の状態に戻したいときは、VERSION=0オプションを使います。
  $ rails db:migrate VERSION=0

  演習③
  ・カスタムヘルパー追加