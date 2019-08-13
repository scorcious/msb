class RankingsController < ApplicationController
  def index
    @ranking = Category.ranking_top_categories(10)
  end
end
