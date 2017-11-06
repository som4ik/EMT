require "base64"

class UrlsHolder < ApplicationRecord
  validates :short_url, :long_url, presence: true

  before_validation :set_short_url

  private

  # define the short url before create and regenerated while its in db
  #
  def set_short_url(hex_generator: SecureRandom)
    self.short_url = hex_generator.hex(5)
    while UrlsHolder.pluck(:short_url).include? self.short_url
      self.short_url = hex_generator.hex(5)
    end
  end
end
