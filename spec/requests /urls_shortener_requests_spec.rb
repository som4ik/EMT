require "rails_helper"

RSpec.describe "UrlsShortener manager", :type => :request do
  let(:long_url) {"https://www.test.com"}

  it "returns valid shortened url" do
    post "/", params: {longUrl: long_url}
    short_url = JSON.parse(response.body)["url"]
    path = URI.parse(short_url).path
    expect(path).to be_present
  end

  it "redirect on short url to long url" do
    post "/", params: {longUrl: long_url}
    short_url = JSON.parse(response.body)["url"]
    path = URI.parse(short_url).path
    get path
    expect(response).to redirect_to(long_url)
  end
end
