require "rails_helper"

RSpec.describe UrlsShortner do
  describe "Generate short_url and save UrlHolder object" do

    it "should build url holder object with short url" do
      long_url = "https://www.its.long_url_for.test"

      url = UrlsShortner.generate(long_url)
      expect(url.short_url.length).to be < long_url.length
    end
  end
end
