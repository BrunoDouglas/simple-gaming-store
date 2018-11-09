# PagesController class
class PagesController < ApplicationController

  add_breadcrumb "Home", :root_path

  def main
    page = 1
    page = params[:page] if request.get?

    @products = Game.order(created_at: :desc).page(page).per(8)

  end

  def about
    add_breadcrumb "About", about_path
    @content = Page.where(name: 'about').first
  end

  def contact
    add_breadcrumb "Contact", contact_path
    @content = Page.where(name: 'contact').first
  end
end
