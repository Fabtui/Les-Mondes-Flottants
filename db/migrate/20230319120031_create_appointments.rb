class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.text :comment
      t.string :category
      t.bigint :artist_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
