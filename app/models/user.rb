class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable,
         :authentication_keys => [:login]

  # Define virtual attribute that can contain either an email
  # or a username while signing in
  attr_accessor :login

  validates_presence_of :username
  has_many :projects

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :password, :password_confirmation

  # From:
  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  	else
  		where(conditions).first
  	end
  end
end
