class RankingsController < ApplicationController
  def index
    @ranking_a = Category.ranking_per_user_category_level(50)
    @ranking_b = Category.ranking_per_user_category(50)
    @ranking_c = Category.ranking_per_user(50)
  end
end

# @categories = Category.all
# @categories.each do |c|
#   c.update(points: rand(500..800))
#   c.save
# end
