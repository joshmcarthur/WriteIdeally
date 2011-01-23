class Idea < ActiveRecord::Base
  belongs_to :user
  validates_associated :user
  validates_presence_of :title


  attr_reader :new_tags


  ## TAGGING ##
  acts_as_taggable

  ## SEARCHING ##
  define_index do
    indexes :body
    indexes :title
    indexes tags.name, :as => :tag_name
  end

  ## SCOPING ##
  default_scope :order => 'updated_at DESC'
  def self.mine(user)
    where(:user_id => user.id) if user.is_a?(User) #This isn't a lambda scope because I don't like lambdas
  end

  def new_tags=(tags)
    self.user.tag(self, :with => tags.split(/\,\s+/), :on => :tags) if tags && self.user
  end

end

