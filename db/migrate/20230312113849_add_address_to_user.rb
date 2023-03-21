class AddAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :name, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :artist, :boolean, default: false
    add_column :users, :speciality, :string
    add_column :users, :description, :text
    add_column :users, :start_time, :string, default: '00:00'
    add_column :users, :end_time, :string, default: '00:00'
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :linkedin, :string
  end
end
