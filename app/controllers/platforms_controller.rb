# PlatformController class
class PlatformsController < ApplicationController
  add_breadcrumb "Home", :root_path
  def show
    page = 1
    id = nil
    if request.get?
      id = params[:id]
      page = params[:page]
    end
    @platform = Platform.find(id)
    @products = Game.where(platform: @platform).order(:name).page(page).per(8)
    add_breadcrumb @platform.name, @platform
  end
end
