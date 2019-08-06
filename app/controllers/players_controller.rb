class PlayersController < ApplicationController

    def create
    @player = Player.new
    @player.user = current_user
    @player.status = "accepted"
    @match = Match.find(params[:match_id])
    @player.team = params["player"]["team"]
    @player.match = @match
    authorize @player
    if @player.save!
      redirect_to match_path(@match)
    end
  end

end
