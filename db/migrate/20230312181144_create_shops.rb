class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.text :caption
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.string :linkedin
      t.string :global_opening
      t.string :monday_opening
      t.string :tuesday_opening
      t.string :wednesday_opening
      t.string :thursday_opening
      t.string :friday_opening
      t.string :saturday_opening
      t.string :sunday_opening

      t.timestamps
    end
  end
end
