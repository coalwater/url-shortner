class UrlController < ApplicationController
  before_action :set_url, only: %i(show)
  def show
    if @url
      redirect_to @url.original_url
    else
      render file: 'public/404.html', status: :not_found
    end
  end

  private
  def set_url
    @url = Url.find_by_key(url_param)
  end

  def url_param
    params.require :id
  end
end
