class PlayersController < ApplicationController

  def create
    if params[:player][:team].present?
      @player = Player.new
      @player.user = current_user
      @player.status = "accepted"
      @match = Match.find(params[:match_id])
      @player.team = params[:player][:team]
      @player.match = @match
      authorize @player
      if @player.save!
        redirect_to match_path(@match)
      end
    else
      authorize @player = Player.new
      @match = Match.find(params[:match_id])

      challenger = @match.players.select { |p| p.user == current_user }

      @player.match = @match
      @player.user = User.find(params[:player][:user_id])
      @player.team = challenger[0].team == 'A' ? 'B' : 'A'
      @player.status = 'pending'

      if @player.save!
        redirect_to match_path(@match)
      end
    end
  end
end
