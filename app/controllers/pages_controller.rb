class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @no_search_bar = true
    @no_container = true
    @matches = Match.where("status != ? AND status != ?", "past", "full").sample(3)

    # Notifications
    @challenges_count = policy_scope(Player).where(user_id: current_user, status: 'pending').count
    @matches_count = find_all_matches_user_signed_up.count
    @buddies_pending_count = current_user.requested_friends.count
    @total_count = @challenges_count + @matches_count + @buddies_pending_count
  end

  def index
    # TODO: SEARCH FUNCTIONS
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
