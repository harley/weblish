# gravatar_helper.rb
module GravatarHelper
  def gravatar_url(user, options = {})
    # if user.user_image_url.present?
    #  user.user_image_url
    # else
    # sets our custom image path

    # pass in the user's email through Digest::MD5.hexdigest downcase
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    options[:s] ||= 48

    #returns the url for the gravatar image or our custom image if no gravatar
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{options[:s]}&d=identicon"
  end

  def gravatar_for(user)
    image_tag gravatar_url(current_user), class: 'gravatar'
  end
end
