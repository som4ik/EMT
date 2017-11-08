class UrlsShortnerController < ApplicationController
  before_action :validate_params, only: [:create]

  #
  # post start the process
  #
  # @return [Json] ex: {url: "whatever23121"}, code: 200
  #
  def create
    url = UrlsShortner.generate url_params["longUrl"]

    if url.save
      render json: { url: "#{request.protocol}#{request.host_with_port}/#{url.short_url}" }
    else
      render json: "NOK"
    end
  end

  #
  # responsible of defining urls by shortner url
  #
  # @return [Json] ex: {longUrl: "https://www.whatever.com"}
  #
  def show
    url = UrlsHolder.find_by(short_url: params[:short_url])
    redirect_to url.long_url
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
