# SearchController class
class SearchController < ApplicationController
  def index
    @products = Game.where('name LIKE ?', "%#{params[:searchInput]}%")
                    .where('platform_id = ?', params[:searchCategory])
                    .page(params[:page])
                    .per(8)
  end
end
