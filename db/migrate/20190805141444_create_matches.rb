class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :location
      t.text :description
      t.time :time
      t.string :level
      t.integer :number_of_players
      t.string :status
      t.string :photo, default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
      t.string :score
      t.string :winner
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
