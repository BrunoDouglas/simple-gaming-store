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

  def addToCart
    id = params[:id]
    cart = session[:cart] || {id => 0}

    cart[id] = cart[id].to_i || 0
    cart[id] +=  params[:qtyNumber].to_i
    session[:cart] = cart
    redirect_to root_path
  end



  def updateCart
    id = params[:id]
    cart = session[:cart] || {id => 0}


    return removeCart if params[:qtyNumber].to_i == 0

    cart[id] = cart[id].to_i || 0
    cart[id] =  params[:qtyNumber].to_i
    session[:cart] = cart
    redirect_to '/cart'
  end
  def removeCart
    id = params[:id]
    cart = session[:cart] || {id => 0}
    cart.delete_if { |h| !h[id].nil? }
    session[:cart] = cart
    redirect_to '/cart'
  end
end
