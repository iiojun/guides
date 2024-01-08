class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :x_axis
      t.string :y_axis

      t.timestamps
    end
  end
end
