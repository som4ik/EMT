require "rails_helper"

RSpec.describe UrlsShortnerController, type: :controller do
  describe "post requests on app root" do
    it "should render 200 with short url" do
      expect do
        post :create, params: {longUrl: "https://localhost:3000/fmee"}
        expect(response.code).to eq("200")
      end.to change { UrlsHolder.count }.by(1)
    end
  end
end
