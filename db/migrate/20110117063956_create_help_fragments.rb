class CreateHelpFragments < ActiveRecord::Migration
  def self.up
    create_table :help_fragments do |t|
      t.string :stub, :null => false
      t.string :title
      t.text :content

      t.timestamps
    end

    add_index :help_fragments, :stub, :unique => true
  end

  def self.down
    drop_table :help_fragments
  end
end

