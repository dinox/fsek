# encoding=utf-8
class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
	protect_from_forgery
	check_authorization :unless => :devise_controller?
=begin
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end
=end
end
