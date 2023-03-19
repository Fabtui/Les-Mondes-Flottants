class CreateArtistAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :artist_appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
