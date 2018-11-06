class ApplicationController < ActionController::Base
  helper_method :platforms
  def platforms
    @platforms = Platform.all
  end
end
