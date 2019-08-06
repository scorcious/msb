class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
    add_column :users, :bio, :text
    add_column :users, :gender, :string
    add_column :users, :photo, :string, default: "image/upload/v1565065662/v9rqr29fvuvsmyml5a7o.jpg"
  end
end
