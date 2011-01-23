class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable
  #Extra validation for username field
  validates :username, :presence => true
  validates_format_of :username, :with => /\A[a-zA-Z0-9]+\z/, :message => "must be alphanumeric."
  validates_length_of :username, :in => 6..25


  acts_as_tagger

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  has_many :ideas

end

