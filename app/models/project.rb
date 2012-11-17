class Project < ActiveRecord::Base
  belongs_to :user, :counter_cache => true

  attr_protected :name

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :user_id, :unless => :trial

  scope :not_trials, where(:trial => false)

  def set_name_from_params_or_default(attrs = {})
  	if attrs and attrs.key?(:name)
  		self.name = attrs[:name]
  	else
  		self.name = I18n.t('projects.defaults.name')
  	end
  end
end
