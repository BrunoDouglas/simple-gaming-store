# ApplicationController class
class ApplicationController < ActionController::Base
  before_action :load_cart
  before_action :loggedUser

  helper_method :platforms
  def platforms
    @platforms = Platform.all
  end

  def loggedUser
    userId = session[:userId] || false
    @loggedUser = userId ? Credential.find(userId) : false
  end

  def load_cart

    @total = 0
    cart = session[:cart]
    @qty = 0
    cart.each do |id, value|
      game = Game.find(id)

      @total += game.price * value.to_i
      @qty += value.to_i
    end
  end

end
