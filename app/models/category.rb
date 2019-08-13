class Category < ApplicationRecord
  belongs_to :user

  def self.ranking_per_user_category_level(limit)
    Category.select("user_id, name, level, sum(points) as points").group("user_id, name, level").order("points desc").limit(limit)
  end

  def self.ranking_per_user_category(limit)
    Category.select("user_id, name, sum(points) as points").group("user_id, name").order("points desc").limit(limit)
  end

  def self.ranking_per_user(limit)
    Category.select("user_id, sum(points) as points").group("user_id").order("points desc").limit(limit)
  end
end
