require 'rails_helper'

RSpec.describe UrlsHolder, type: :model do
  it "can't be saved without long_url" do
    url_holder = UrlsHolder.new
    expect( url_holder.save ).to eq(false)
  end

  describe "save valid urls holder " do
    before :each do
      @url_holder =  UrlsHolder.new(long_url: "https://www.what_ever_test.com")
    end

    it "can be saved with long_url" do
      expect( @url_holder.save ).to eq(true)
    end
  end
end
