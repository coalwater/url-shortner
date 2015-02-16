class DashboardsController < ApplicationController
  layout 'backend'

  def show
    @urls_count = Url.count
    @hits_count = UrlHit.count
  end

  def urls
    @urls = Url.all
  end

  def hits
    @hits = UrlHit.includes(:url).order(:url_id)
  end

end
