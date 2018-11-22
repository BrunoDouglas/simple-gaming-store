require 'date'

# PagesController class
class PagesController < ApplicationController
  add_breadcrumb 'Home', :root_path
  add_flash_types :status_message

  def main
    page = 1
    page = params[:page] if request.get?

    filter = ''
    filter = params[:filter] if params[:filter] && params[:filter] == 'NEW' || params[:filter] == 'Recently Updated'

    now = Date.today
    seven_days_ago = (now - 7)

    if filter == 'New'
      @products = Game.where('created_at > ?', seven_days_ago).order(created_at: :desc).page(page).per(8)
    elsif filter == 'Recently Updated'
      @products = Game.where('updated_at > ?', seven_days_ago).order(updated_at: :desc).page(page).per(8)
    else
      @products = Game.order(created_at: :desc).page(page).per(8)
    end
    @arr = [filter, @products]
  end

  def about
    add_breadcrumb 'About', about_path
    @content = Page.where(name: 'about').first
  end

  def contact
    add_breadcrumb 'Contact', contact_path
    @content = Page.where(name: 'contact').first
  end

  def login
    @provinces = Province.order(:name)
    add_breadcrumb 'Login', '/login'
  end

  def logout
    session[:userId] = nil
    redirect_to '/'
  end

  def doLogin
    user = Credential.where('email = ? AND password = ?', params[:email], Digest::SHA256.hexdigest(params[:password])).first || false
    if user
      session[:userId] = user.id
      return redirect_to '/checkout', status_message: 'Signed In successfully!'
    end

    return redirect_to '/login', status_message: "The Customer was not found!"
  end

  def cart
    @total = 0
    @cart = session[:cart] || {}
    @qty = 0
    @games = Array.new
    @cart.each do |id, value|
      game = Game.find(id)
      @games << game
      @total += game.price * value.to_i
      @qty += value.to_i
    end
    add_breadcrumb 'Cart', '/cart'
  end

  def checkout
    userId = session[:userId] || false
    return redirect_to '/login', status_message: "Please Sign In before proceeding" if !userId

    @total = 0
    @cart = session[:cart] || {}

    return redirect_to '/', status_message: "Your cart is empty!" if @cart.size == 0

    @qty = 0
    @games = Array.new
    @cart.each do |id, value|
      game = Game.find(id)
      @games << game
      @total += game.price * value.to_i
      @qty += value.to_i
    end
    @customer = session[:customer]
    @taxes = ((@total * @customer.address.province.gst) + (@total * @customer.address.province.pst))
    session[:total] = @total + @taxes
    add_breadcrumb 'Check Out', '/checkout'
  end

  def doRegister
    errors = false;
    @credentials = Credential.create(email: params[:email], password: Digest::SHA256.hexdigest(params[:password]))
    @address = Address.create(line1: params[:line1], city: params[:city], postal_code: params[:postal_code], province: Province.find(params[:province]))
    @customer = Customer.create(name:  params[:name], age: params[:age], phone: params[:phone], credential: @credentials, address: @address)

    if ( @credentials.errors.size > 0 || @address.errors.size > 0 || @customer.errors.size > 0 ) then

      errors = true
      flash[:status_message] = "The following Errors prevented the action from completing successfully: " +
                                (@credentials.errors.size > 0 ? @credentials.errors.full_messages.join(", ") : " " ) +
                                (@address.errors.size > 0 ? @address.errors.full_messages.join(", ") : " " ) +
                                (@customer.errors.size > 0 ? @customer.errors.full_messages.join(", ") : " " )

      return redirect_to "/login"
    end
    session[:userId] = @customer.credential_id
    redirect_to '/checkout'
  end

  def placeOrder
    userId = session[:userId] || false

    return redirect_to '/login', status_message: "Please Sign In before proceeding" if !userId

    @cart = session[:cart]
    @customer = session[:customer]
    order = Order.create(status_id: 1, customer: @customer, order_date: DateTime.now)

    @cart.each do |id, value|
      game = Game.find(id)
      item = Item.create(order: order, price: game.price, gst: @customer.address.province.gst, pst: @customer.address.province.pst, hst: @customer.address.province.hst, quantity: value.to_i, game: game)
    end

    redirect_to '/charges/new'
  end
end
