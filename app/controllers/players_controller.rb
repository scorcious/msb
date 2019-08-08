class PlayersController < ApplicationController

  def create
    if params[:player][:team].present?
      # add the player into the team
      # TODO: status - close
      @player = Player.new
      @player.user = current_user
      @player.status = "accepted"
      @match = Match.find(params[:match_id])
      @player.team = params[:player][:team]
      @player.match = @match
      authorize @player
      if @player.save!
        if @match.full?
          @match.status = "close"
          @match.save
        end
        redirect_to match_path(@match)
      end
    else
      # to challenge someone
      authorize @player = Player.new
      @match = Match.find(params[:match_id])

      challenger = @match.players.where(user_id: current_user).first

      challenger = match_auto_join if challenger.nil?

      @player.match = @match
      @player.user = User.find(params[:player][:user_id])

      @player.team = challenger.team == 'A' ? 'B' : 'A'
      @player.status = 'pending'

      if @player.save!
        redirect_to match_path(@match)
      end
    end
  end

  private

  def match_auto_join
    Player.create!(
      match_id: @match.id,
      user_id: current_user.id,
      team: 'A',
      status: 'accepted'
    )
  end
end
