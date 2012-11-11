class Project < ActiveRecord::Base
  belongs_to :user, :counter_cache => true

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :user_id
end
