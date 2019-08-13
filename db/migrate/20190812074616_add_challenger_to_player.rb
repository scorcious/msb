class AddChallengerToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :challenger_id, :integer, default: 0
  end
end
