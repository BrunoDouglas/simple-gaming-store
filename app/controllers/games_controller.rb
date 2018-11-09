# GamesController class
class GamesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def show
    id = nil
    id = params[:id] if request.get?

    @game = Game.find(id)
    add_breadcrumb @game.platform.name, @game.platform
    add_breadcrumb @game.name, @game
  end
end
