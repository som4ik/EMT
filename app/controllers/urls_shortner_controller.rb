class UrlsShortnerController < ApplicationController
  before_action :validate_params, only: [:call]

  #
  # post start the process
  #
  # @return [Json] ex: {url: "whatever23121"}, code: 200
  #
  def call
    url = UrlsShortner.call(url_params["longUrl"])
    if url
      render json: { url: "#{request.protocol}#{request.host}:#{request.port}/#{url.short_url}" }
    else
      render json: "NOK"
    end
  end

  #
  # responsible of defining urls by shortner url
  #
  # @return [Json] ex: {longUrl: "https://www.whatever.com"}
  #
  def find
    url = UrlsHolder.find(params[:url_id])
    if url
      render json: {location: url.long_url }
    else
      render json: "NOK", code: 404
    end
  end

  private

  def url_params
    params.permit(:longUrl)
  end

  def validate_params
    if !params["longUrl"].present?
      render json: "NOK no url provided"
    end
  end
end
