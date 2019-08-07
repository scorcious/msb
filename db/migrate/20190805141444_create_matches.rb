class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :location
      t.text :description
      t.time :time
      t.integer :level
      t.integer :number_of_players
      t.string :status
      t.string :photo, default: "image/upload/v1565065662/v9rqr29fvuvsmyml5a7o.jpg"
      t.string :score
      t.string :winner
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
