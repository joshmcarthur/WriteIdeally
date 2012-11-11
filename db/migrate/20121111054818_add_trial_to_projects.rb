class AddTrialToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :trial, :boolean, :default => false, :null => false
    add_index :projects, :trial
  end
end
