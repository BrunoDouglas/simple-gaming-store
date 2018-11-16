class ChargesController < ApplicationController
  before_action :loggedUser

  def new
    @total = session[:total] && session[:total].to_d > 0 ?  session[:total] : false

    redirect_to '/checkout' if !@total

  end

  def create
    # Amount in cents
    @amount = session[:total].to_i * 100
    cust = session[:customer]

    customer = Stripe::Customer.create(
      :email => cust.credential.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "#{cust.name} - #{@amount}",
      :currency    => 'cad'
    )

    session[:cart] = nil
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
