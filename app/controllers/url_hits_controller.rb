class UrlHitsController < ApplicationController
  before_action :set_hit

  def destroy
    if @hit.destroy
      redirect_to dashboard_path, notice: 'Hit was successfully deleted'
    else
      redirect_to dashboard_path, alert: 'Something went wrong'
    end
  end

  private
  def set_hit
    @hit = UrlHit.find params[:id]
  end
end
