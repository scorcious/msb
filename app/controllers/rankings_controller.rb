class RankingsController < ApplicationController
  def index
    @rankings = Category.ranking_top_categories(10)
  end
end
