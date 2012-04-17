class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :username, :email, :real_name, :password, 
	:password_confirmation, :remember_me

	has_many :news

	validates :username, :presence => true, :uniqueness => true
	validates :real_name, :presence => true
=begin	
	#Attributes
	attr_reader :password
	attr_accessor :password_confirmation
	
	def password=(password)
		@password = password

		if password.present?
			self.hashed_password = BCrypt::Password.create(password)
		end
	end

	#Relationships
	has_many :news

	#Validations of the fields
	validates :username, :email, :presence => true, :uniqueness => true
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
	validates :password, :confirmation => true
	validates :real_name, :presence => true
	validate :password_must_be_present

	#Methods :D	
	def User.authenticate(username, password)
		if user = find_by_username(username)
			if BCrypt::Password.new(user.hashed_password) == password
				return user
			end
		end
	end

	private
	def password_must_be_present
		errors.add(:password, "Missing Password") unless hashed_password.present?
	end
=end
end
