class PagesController < ApplicationController
  def about
    @content = Page.where(name: 'about').first
  end

  def contact
    @content = Page.where(name: 'contact').first
  end
end
