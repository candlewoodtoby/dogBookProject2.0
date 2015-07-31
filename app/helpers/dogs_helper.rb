module DogsHelper
    def gravatar_for(dog, options = {size: 20})
    gravatar_id = Digest::MD5::hexdigest(dog.name.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: dog.name, class: "gravatar")
  end
end
