class DashboardController < ApplicationController
  layout 'backend'

  def index
    @urls_count = Url.count
    @hits_count = UrlHit.count
  end

  def urls
    @urls = Url.all
  end
end
