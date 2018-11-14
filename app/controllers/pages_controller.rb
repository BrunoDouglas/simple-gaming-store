require 'date'

# PagesController class
class PagesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def main
    page = 1
    page = params[:page] if request.get?

    filter = ''
    filter = params[:filter] if params[:filter] && params[:filter] == 'NEW' || params[:filter] == 'Recently Updated'

    now = Date.today
    seven_days_ago = (now - 7)
    if filter == 'NEW'
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
end
