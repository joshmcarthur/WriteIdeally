class CreatePlotPoints < ActiveRecord::Migration
  def change
    create_table :plot_points do |t|
      t.references :project
      t.text :title, :null => false

      t.timestamps
    end
  end
end
