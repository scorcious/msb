class FixDefaultForCategories < ActiveRecord::Migration[5.2]
  def change
    change_column :categories, :points, :integer, default: 300
  end
end
