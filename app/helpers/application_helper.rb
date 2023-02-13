module ApplicationHelper
    # Railsのビューでは膨大な数の組み込み関数が使えますが、それだけでなく、新しく作成することもできます。新しく作ったメソッドはカスタムヘルパーと呼ばれます
    # ページごとの完全なタイトルを返す。もしタイトルをまったく与えていなければ、タイトルが空欄になってしまいます。
    #これを防ぐには、すべてのページで使う基本タイトルを定め、特定のページでは異なるタイトルに変更できるようなオプションを与える
    def full_title(page_title = '')
      base_title = "Ruby on Rails Tutorial Sample App"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
    end
end
