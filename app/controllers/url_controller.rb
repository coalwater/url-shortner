class UrlController < ApplicationController
  before_action :set_url, only: %i(show)

  # GET /short-url
  #
  # This action fetches a single shortened url from the database and
  # redirects the user to the original long url, with each hit the
  # action saves a hit on the url,
  # If the url is not found, a simple 404 template is rendered
  def show
    if @url
      redirect_to @url.hit_and_return(ip: request.ip)
    else
      render file: 'public/404.html', status: :not_found
    end
  end

  private
  # Sets the url object for processing
  def set_url
    @url = Url.find_by_key(url_param)
  end

  # Returns the id (url key) from the parameters
  #
  # @return [String] The id (key)
  def url_param
    params.require :id
  end
end
