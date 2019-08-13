class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @no_search_bar = true
    @no_container = true
    @matches = Match.where("status = ?", "open").sample(3)
  end
  
  def index
    # TODO: SEARCH FUNCTIONS
    @no_search_bar = true
  end

  private

  def find_all_matches_user_signed_up
    all_matches_signed_up = []
    Match.all.each do |m|
      if m.status != "past" && m.status != "cancelled"
        m.players.each do |p|
          # finding --> current user is signed up these events
          if p.user.id == current_user.id
            all_matches_signed_up << m
          end
        end
      end
    end
    return all_matches_signed_up
  end
end
