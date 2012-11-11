class AddProjectsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :projects_count, :integer, :null => false, :default => 0
  end
end
