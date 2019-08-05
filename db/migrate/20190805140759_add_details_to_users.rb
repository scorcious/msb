class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :bio, :text
    add_column :users, :gender, :string
    add_column :users, :photo, :string
  end
end
