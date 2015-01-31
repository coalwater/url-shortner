class DashboardController < ApplicationController
  layout 'backend'

  def index
    @urls = Url.all
    @hits = UrlHit.all
  end

  def urls
    @urls = Url.all
  end
end
