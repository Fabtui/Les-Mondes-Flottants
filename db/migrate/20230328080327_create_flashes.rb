class CreateFlashes < ActiveRecord::Migration[7.0]
  def change
    create_table :flashes do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :height
      t.integer :width
      t.string :duration
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
