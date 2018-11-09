# GamesController class
class GamesController < ApplicationController
  def show
    id = nil
    id = params[:id] if request.get?

    @game = Game.find(id)
  end
end
