class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
end

#純粋なRuby言語であれば、これらのメソッドは何も実行しません。しかし、Railsでは動作が異なります。
# StaticPagesControllerはRubyのクラスですが、ApplicationControllerクラスを継承しているため、
# StaticPagesControllerのメソッドは（たとえ何も書かれていなくても）Rails特有の振る舞いをします。
# 具体的には、/static_pages/homeというURLにアクセスすると、RailsはStaticPagesコントローラを参照し、
# homeアクションに記述されているコードを実行します。その後、そのアクションに対応するビューを出力します。
# 今回の場合、homeアクションが空になっているので、/static_pages/homeにアクセスしても、単に対応するビューが出力されるだけです。