# encoding=utf-8
class ApplicationController < ActionController::Base
	before_filter :authorize
	protect_from_forgery

	protected
	def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, :alert => "Du måste vara inloggad för att kunna göra detta"
		end
	end
end
