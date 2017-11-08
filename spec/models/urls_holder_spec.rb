require 'rails_helper'

RSpec.describe UrlsHolder, type: :model do
  it "can't be saved without long_url" do
    url_holder = UrlsHolder.new
    expect( url_holder.save ).to eq(false)
  end

  describe "save valid urls holder " do
    it "can be saved with long_url and short_url" do
      url_holder =  UrlsHolder.new(long_url: "https://www.what_ever_test.com")

      url_holder.short_url = "what_evert_test"
      expect( url_holder.valid? ).to eq(true)
    end
  end
end
