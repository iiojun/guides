class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.float :value
      t.boolean :x
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
