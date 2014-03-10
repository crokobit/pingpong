module ApplicationHelper

  def gravatar_image_tag email = 'nobody@example.com', size = 150
    email ||= 'nobody@example.com'
    hash = Digest::MD5.hexdigest(email)
    image_tag "//www.gravatar.com/avatar/#{hash}?s=#{size}", height: size, width: size
  end

  def like_button link
    content_tag(:div, class: 'fb-like-box pull-left') do
      content_tag(:div, '', class: 'fb-like', data: { href: link, layout: 'button_count', show_faces: 'false', width: 250, send: 'false' })
    end
  end

  def tweet_button
    content_tag(:div, class: 'tweet-box pull-left') do
      link_to 'Tweet', 'ttps://twitter.com/share', class: 'twitter-share-button hidden-xs', data: { lang: 'en' }
    end
  end

end
