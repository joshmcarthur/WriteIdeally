class HelpFragment < ActiveRecord::Base
  validates_presence_of :stub
  validates_uniqueness_of :stub

  acts_as_taggable

  define_index do
    indexes title
    indexes content
    indexes tags.name, :as => :tag_name
  end
end

