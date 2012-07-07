# encoding=utf-8
class ApplicationController < ActionController::Base
	before_filter :do_before_filter
	protect_from_forgery
	check_authorization :unless => :devise_controller?

    def do_before_filter
      authenticate_user!
      @current_action = action_name
      @current_controller = controller_name
    end

=begin
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end
=end
end
