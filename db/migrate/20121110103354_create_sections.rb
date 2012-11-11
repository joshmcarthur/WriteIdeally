class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :plot_point
      t.text :title, :null => false
      t.text :content

      t.timestamps
    end
  end
end
