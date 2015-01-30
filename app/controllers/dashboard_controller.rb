class DashboardController < ApplicationController
  def index
    @urls = Url.all
    @hits = UrlHit.all
  end
end
