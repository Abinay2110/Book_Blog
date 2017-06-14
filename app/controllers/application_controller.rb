class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
	flash[:notice] = "Access Denied"
	redirect_to bviews_path
  end
end
