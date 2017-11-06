class UrlsHolder < ApplicationRecord
  validates :long_url, presence: true

  # TODO:
  # add method to encode URL/
  # add method to decode URL/
end
