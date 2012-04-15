require 'bcrypt'

class User < ActiveRecord::Base
	attr_accessible :username, :email, :real_name, :password, :password_confirmation

	validates :username, :presence => true, :uniqueness => true
	validates :password, :confirmation => true

	#attr_accessor :password_confirmation
	attr_reader :password

	validate :password_must_be_present
	
	def password=(password)
		@password = password

		if password.present?
			self.hashed_password = BCrypt::Password.create(password)
		end
	end

	def authenticate(username, password)
		if user = find_by_username(username)
			if user.hashed_password == BCrypt::Password.create(password)
				return user
			end
		end
	end

	private
	def password_must_be_present
		errors.add(:password, "Missing Password") unless hashed_password.present?
	end
end
