# SearchController class
class SearchController < ApplicationController
  add_breadcrumb 'Home', :root_path
  def index
    @products = Game.where('name LIKE ?', "%#{params[:searchInput]}%")
                    .where('platform_id = ?', params[:searchCategory])
                    .page(params[:page])
                    .per(8)
    add_breadcrumb 'Search'
    add_breadcrumb params[:searchInput]
  end
end
