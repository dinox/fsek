# encoding=utf-8
class SessionsController < ApplicationController
  	skip_before_filter :authorize

	def new
  end

  def create
	if user = User.authenticate(params[:username], params[:password])
		session[:user_id] = user.id
		redirect_to login_url, :alert => "Inloggad med id=#{session[:user_id]}"
	else
		redirect_to login_url, :alert => "Ogiltig lösenord/användarnamnkombination"
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to root_url, :alert => "Du är nu utloggad"
  end
end
