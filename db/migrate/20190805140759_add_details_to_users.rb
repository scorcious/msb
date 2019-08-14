class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :bio, :text
    add_column :users, :gender, :string
    add_column :users, :photo, :string, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
  end
end
