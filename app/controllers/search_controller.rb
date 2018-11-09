class SearchController < ApplicationController
  def index
    @name = params[:searchInput] if params[:searchInput]
    @category = params[:searchCategory] if params[:searchCategory]
    page = params[:page] if request.get?
    @products =  Game.where('name LIKE ?', "%#{@name}%")
                     .where('platform_id = ?', @category)
                     .page(page)
                     .per(8)
  end
end
