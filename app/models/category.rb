class Category < ApplicationRecord
  belongs_to :user

  # Rankings System
  def self.ranking_top_categories(limit)
    Category.select("name, sum(points) as points")
      .group("name")
      .order("points desc")
      .limit(limit)
  end

  def self.ranking_per_category_user(category, limit)
    ranking = Category.select("user_id, name, sum(points) as points")
      .where("name = ?", [category])
      .group("user_id, name").order("points desc").limit(limit).to_a
  end

  # Category.ranking_position("Tennis", 72)
  def self.ranking_position(category, user_id)
    puts 'testing'
    ranking = Category.select("user_id, name, sum(points) as points")
      .where("name = ?", category)
      .group("user_id, name").order("points desc").to_a

    position = ranking.pluck(:user_id).index(user_id)

    if position.nil?
      {
        user_id: user_id,
        points: -1,
        position: -1
      }
    else
      {
        user_id: user_id,
        points: ranking[position].points,
        position: position += 1
      }
    end
  end
end