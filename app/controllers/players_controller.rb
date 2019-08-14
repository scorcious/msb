class PlayersController < ApplicationController
  before_action :set_match, only: [:create, :accept_challenge]
  before_action :challenge_params, only: [:update]
  before_action :set_challenge, only: [:update]
  skip_before_action :verify_authenticity_token, only: [:join_team]


  def index
    @challenges = policy_scope(Player).where(user_id: current_user, status: 'pending')
  end

  def update
    authorize @challenge
    if @challenge.update(challenge_params)
      if challenge_params["status"] == "declined"
        redirect_to players_path
      else
        redirect_to matches_path(user_id: current_user.id)
      end
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
      @player.challenger_id = current_user.id
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
    elsif params[:player][:challenged].present?
      authorize @player = Player.new
      challenger = @match.players.where(user_id: current_user).first
      @player.match = @match
      @player.challenger_id = challenger.user_id
      @player.user = User.find(params[:player][:challenged])
      @player.team = challenger.team == 'A' ? 'B' : 'A'
      @player.status = 'pending'
      if @player.save
        if @match.full?
          @match.status = "close"
          @match.save
        end
      else
        @player.errors.messages
      end
      redirect_to match_path(@match)
    else
      # to challenge someone
      authorize @player = Player.new

      challenger = @match.players.where(user_id: current_user).first

      challenger = match_auto_join if challenger.nil?
      @player.challenger_id = challenger.user_id
      @player.match = @match
      @player.user = User.find(params[:player][:user_id])

      @player.team = challenger.team == 'A' ? 'B' : 'A'
      @player.status = 'pending'

      if @player.save
        if @match.full?
          @match.status = "close"
          @match.save
        end
      else
        @player.errors.messages
      end
      redirect_to match_path(@match)
    end
  end

  def join_team

    authorize @player = Player.create!(
        match_id: Match.first.id,
        user_id: User.first.id,
        team: 'A',
        status: 'accepted'
      )

    response = {
      status: 'chegou aqui!',
      player: @player.id
    }

    render json: response

    # redirect_to match_path(@match) if @player.save!

    # authorize @forum = Forum.new(forum_params)
    # @match = Match.find(params[:match_id])
    # @forum.user = current_user
    # @forum.match = @match
    # @forum.save

    # @forums = @match.forums.count
    # response = {
    #   name: @forum.user.name.split(" ").first,
    #   timestamp: Time.now.strftime("%H:%M"),
    #   forum_empty: (@forums == 1) ? "true" : "false"
    # }

    # render json: response
  end

  private

  def set_match
    if params[:player][:match_id].present?
      @match = Match.find(params[:player][:match_id])
    else
      @match = Match.find(params[:match_id])
    end
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
