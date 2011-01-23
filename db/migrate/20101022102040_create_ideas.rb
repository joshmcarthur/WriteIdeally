class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.column :title, :string, :null => false
      t.column :body, :text
      t.column :user_id, :integer, :null => false

      t.timestamps
    end

    add_index :ideas, :title
    add_index :ideas, :user_id
  end

  def self.down
    drop_table :ideas
  end
end

