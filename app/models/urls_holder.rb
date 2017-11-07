class UrlsHolder < ApplicationRecord
  validates :short_url, :long_url, presence: true
end
