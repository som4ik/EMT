class UrlsShortner
  attr_accessor :url

  def self.call(url)
    self.new(url).start
  end

  def initialize(url)
    @url = url
  end

  def start(klass: UrlsHolder, dynamic_routes: DynamiceRoutes)

    url_holder = klass.new(long_url: url)
    url_holder.save

    dynamic_routes.reload
    url_holder
  end
end
