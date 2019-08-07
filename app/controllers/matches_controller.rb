class MatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag].present?
      @matches = policy_scope(Match.tagged_with(params[:tag]))
    else
      @matches = policy_scope(Match).order(created_at: :desc)
    end
    @show_user_match = !(params[:user_id].nil?)
  end

  def show
    authorize @match
    @players_a = @match.players.select { |player| player.team == "A" }
    @players_b = @match.players.select { |player| player.team == "B" }
    @forums = @match.forums
    @forum = Forum.new
    @friends = User.all
    @player = Player.new
  end

  def new
    authorize @match = Match.new
    @tags = Match.select(:city).distinct
  end

  def create
    authorize @match = Match.new(match_params)
    @match.user = current_user
    if @match.save

      add_team_to_player
      add_tags_to_match

      redirect_to @match
    else
      render :new
    end
  end

  def edit
    authorize @match
  end

  def update
    authorize @match
    if @match.update(match_params)
      redirect_to @match
    else
      render :edit
    end
  end

  def destroy
    authorize @match
    if @match.destroy
      redirect_to matches_path
    else
      render :show, notice: 'Error'
    end
  end

  private

  def match_params
    params.require(:match).permit(
      :date,
      :city,
      :location,
      :description,
      :time,
      :level,
      :number_of_players,
      :photo,
      :tag_list
    )
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def add_tags_to_match
    @match.tag_list.add(match_params[:tag_list].split(','))
  end

  def add_team_to_player
    @player = Player.new
    @player.user = current_user
    @player.status = "accepted"
    @player.team = 'A'
    @player.match = @match
    authorize @player
    @player.save!
  end
end
