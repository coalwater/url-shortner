class DashboardsController < ApplicationController
  layout 'backend', except: :homepage

  def show
    @urls_count = Url.count
    @hits_count = UrlHit.count
  end

  def urls
    @urls = Url.all
  end

  def hits
    @hits = UrlHit.all
  end

end
