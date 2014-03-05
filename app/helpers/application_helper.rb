module ApplicationHelper

  def gravatar_image_tag email, size = 150
    hash = Digest::MD5.hexdigest(email)
    image_tag "//www.gravatar.com/avatar/#{hash}?s=#{size}", height: size, width: size
  end

end
