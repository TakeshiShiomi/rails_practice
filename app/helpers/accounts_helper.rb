module AccountsHelper
  def gravatar_for(account, size: 50)
    gravatar_id = Digest::MD5::hexdigest(account.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: account.name, class: "gravatar")
  end
end
