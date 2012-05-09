class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :real_name, :password, 
                  :password_confirmation, :remember_me, :role_ids, :year, 
                  :program

  before_create :default_values # Krok som kallas innan saker creatas.

  #relations
  has_many :news
  has_and_belongs_to_many :roles

  #extra validations outside devise
  validates :username, :presence => true, :uniqueness => true
  validates :real_name, :presence => true

  validates_associated :roles # Se till så att vi inte fuskar med rollerna.

  def default_values
    self.year    ||= Time.now.year
    self.program ||= :f
  end

  #CanCan-authorization
  def has_role? (role)
    return !!self.roles.find_by_tag(role.to_s)
  end
   
  def to_s_fstyle
    if self.program and self.year
      '%s %s%02d' % [self.real_name, self.program.capitalize, self.year % 100]
      # Printf-syntax. Jag älskar den!
    else
      self.real_name
    end
  end

  # Kan komma att ändras i framtiden. Viewar som uttryckligen vill ha 
  # Fxx-biten med i namnet måste använda :to_s_fstyle.
  alias :to_s :to_s_fstyle

#OLD CODE DELETE WHEN LOGIN SYSTEM DONE
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
