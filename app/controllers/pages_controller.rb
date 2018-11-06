# PagesController class
class PagesController < ApplicationController
  def main
    page = 1
    page = params[:page] if request.get?
    @products = Game.order(:name).page(page).per(5)
  end

  def about
    @content = Page.where(name: 'about').first
  end

  def contact
    @content = Page.where(name: 'contact').first
  end
end
