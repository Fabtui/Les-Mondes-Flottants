class AddAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :artist, :boolean, default: false
    add_column :users, :speciality, :string
    add_column :users, :description, :text
  end
end
