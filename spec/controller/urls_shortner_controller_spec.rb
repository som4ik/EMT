require "rails_helper"

RSpec.describe UrlsShortnerController, type: :controller do
  describe "post requests on app root" do
    it "should render 200 with short url" do
      post :call, params: {longUrl: "https://localhost:3000/fmee"}
      expect(response.code).to eq("200")
      expect(UrlsHolder.count).to eq(1)
      expect(UrlsHolder.last.long_url).to eq("https://localhost:3000/fmee")
    end
  end
end
