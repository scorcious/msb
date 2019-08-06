class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :match
      t.references :user, foreign_key: true
      t.string :team
      t.string :status

      t.timestamps
    end
  end
end
