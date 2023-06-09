class CreateTattoos < ActiveRecord::Migration[7.0]
  def change
    create_table :tattoos do |t|
      t.string :name
      t.text :description
      t.string :client
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
