module UrlsShortner

  #
  # define the object/ prepare data (generate short_url)
  #
  # @param  klass: UrlsHolder
  #
  # @return [Object] object of UrlsHolder class
  #
  def self.generate(url, klass: UrlsHolder)

    url_holder = klass.find_or_initialize_by(long_url: url)
    url_holder.short_url = set_short_url

    url_holder
  end


  # define the short url before create and regenerated while its in db
  #
  def self.set_short_url(hex_generator: SecureRandom)
    short_url = hex_generator.hex(5)
    while !UrlsHolder.where(short_url: short_url).count.zero?
      short_url = hex_generator.hex(5)
    end
    short_url
  end
end
