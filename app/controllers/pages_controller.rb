class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @no_search_bar = true
    @no_container = true
  end

  def index
  end
end
