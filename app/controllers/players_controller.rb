class PlayersController < ApplicationController
  before_action :set_match, only: [:create, :accept_challenge]
  before_action :challenge_params, only: [:update]
  before_action :set_challenge, only: [:update]

  def index
    @challenges = policy_scope(Player).where(user_id: current_user, status: 'pending')
  end

  def update
    authorize @challenge
    if @challenge.update(challenge_params)
      redirect_to players_path
    else
      redirect_to players_path
    end
  end

  def create
    if params[:player][:team].present?
      # add the player into the team
      # TODO: status - close
      @player = Player.new
      @player.user = current_user
      @player.status = "accepted"
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

      challenger = @match.players.where(user_id: current_user).first

      challenger = match_auto_join if challenger.nil?

      @player.match = @match
      @player.user = User.find(params[:player][:user_id])
      # raise

      @player.team = challenger.team == 'A' ? 'B' : 'A'
      @player.status = 'pending'

      if @player.save
        redirect_to match_path(@match)
      else
        @player.errors.messages
        redirect_to match_path(@match)
      end
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def set_challenge
    @challenge = Player.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:status)
  end

  def match_auto_join
    Player.create!(
      match_id: @match.id,
      user_id: current_user.id,
      team: 'A',
      status: 'accepted'
    )
  end
end
