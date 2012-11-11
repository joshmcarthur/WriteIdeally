class PlotPoint < ActiveRecord::Base
  attr_accessible :project_id, :title

  validates_presence_of :title
  belongs_to :project
  has_one :user, :through => :project
  has_many :sections
end
