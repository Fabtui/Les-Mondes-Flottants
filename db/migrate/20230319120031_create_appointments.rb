class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :date
      t.text :comment
      t.string :category
      t.bigint :user_id
      t.references :artist, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
