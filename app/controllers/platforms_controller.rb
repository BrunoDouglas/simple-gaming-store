# PlatformController class
class PlatformsController < ApplicationController
  def show
    page = 1
    id = nil
    if request.get?
      id = params[:id]
      page = params[:page]
    end

    @products = Game.where(platform: Platform.find(id)).order(:name).page(page).per(8)
  end
end
