class AddDetailsToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :city, :string
  end
end
