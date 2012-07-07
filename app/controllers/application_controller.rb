# encoding=utf-8
class ApplicationController < ActionController::Base
    before_filter :authenticate_user!
	protect_from_forgery
	check_authorization :unless => :devise_controller?

    before_filter :save_action_controller
    
    def save_action_controller
      @current_action = action_name
      @current_controller = controller_name
    end

    def not_found
        raise ActionController::RoutingError.new('Not Found')
    end

=begin
	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end
=end
end
