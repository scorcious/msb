class MatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    # TODO: SEARCH
    # 1. show user's matches
    # 2. search fn() for all sports, and tags
    # 3. get all tags
    search = false

    if params.key?(:search)
      search = params[:search]
      if search.key?(:query)
        search = params[:search][:query]
        search = search.nil? && search == "" ? false : true
      end
    end

    # INIT
    @all_matches_signed_up = []
    @past_matches = []
    @user_name = params["user_id"].nil? ? "" : (User.find(params["user_id"]).name)

    # SEARCH FOR TAGS
    if params[:tag].present?
      # SHOW ALL MATCHES WITH THE TAG
      @matches = policy_scope(Match.tagged_with(params[:tag]))
      @matches = @matches.select { |match| match.status == "open" }
    elsif search == true && params[:search][:query].empty? == false
      @matches = policy_scope(Match.search_by_game_details(params[:search][:query])
        .where("status = ?", "open")
        .order(created_at: :desc))
      @show_user_match = !(params[:user_id].nil?)
      if @show_user_match
        @matches = Match.search_by_game_details(params[:search][:query])
        .where("user_id = ?", params["user_id"])
        .order(created_at: :desc)
        @all_matches_signed_up = find_all_matches_user_signed_up
        @past_matches = Match.where("status = ?", "past")
      end
    else
      # SHOW ALL MATCHES
      @matches = policy_scope(Match).order(created_at: :desc)
      @matches = Match.where("status = ?", "open").order(created_at: :desc)
      @show_user_match = !(params[:user_id].nil?)
      if @show_user_match
        @matches = Match.where("user_id = ?", params["user_id"]).order(created_at: :desc)
        @all_matches_signed_up = find_all_matches_user_signed_up
        @past_matches = Match.where("status = ?", "past")
      end
    end
  end

  def show
    authorize @match
    @players_a = @match.players.select { |player| player.team == "A" && player.status != "declined" }
    @players_b = @match.players.select { |player| player.team == "B" && player.status != "declined" }
    @forums = @match.forums.order(created_at: :desc)
    @forum = Forum.new
    @player = Player.new

    # friends available to challenge
    @friends = (current_user ? current_user.friends : [])
    if @friends != []
      @friends = @friends.reject do |f|
        player = Player.where("user_id = ? AND match_id = ?", f.id, @match.id)
        if player != []
          player.first.user == f
        end
      end
    end

    @array_A = @players_a.map do |player|
      player.user
    end
    @array_B = @players_b.map do |player|
      player.user
    end
    @all_players = @array_B + @array_A

    # challenges
    @challenges = policy_scope(Player).where("user_id = ? AND match_id = ? AND status = ?", current_user.id, @match.id, "pending")
    unless @challenges == []
      @challenger = User.find(@challenges[0].challenger_id)
    end
  end

  def new
    authorize @match = Match.new
    @tags = Match.select(:city).distinct
  end

  def create
    authorize @match = Match.new(match_params)
    @match.user = current_user
    @match.status = "open"
    if @match.save
      # add
      add_team_to_player
      add_tags_to_match

      # redirect
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
    @match.status = "cancelled"
    @match.save
    redirect_to root_path
  end

  def winner
    @match = Match.find(params[:match_id])
    authorize @match
    @match.winner = params[:match]["winner"]
    @match.save
    calculate_points
    redirect_to match_path(@match)
  end


  def calculate_points
    @match = Match.find(params[:match_id])
    authorize @match

    winner_team = @match.winner.downcase
    winner_points = 30
    draw_points = 10
    category_match = @match.tags[0].name.downcase
    level_match = @match.tags[2].name.downcase

    @match.players.each do |player|
      category_user = Category.find_or_create_by(user_id: player.user_id, name: category_match, level: level_match)
      if player.team.downcase == winner_team
        category_user.points += winner_points
      elsif winner_team == "draw"
        category_user.points += draw_points
      end
      category_user.save
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
    tags = match_params[:tag_list].split(',')
    tags << match_params[:city]
    tags << match_params[:level]
    @match.tag_list.add(tags)
    @match.save
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

  def find_all_matches_user_signed_up
    all_matches_signed_up = []
    Match.all.each do |m|
      if m.status != "past" && m.status != "cancelled"
        m.players.each do |p|
        # finding if current user is signed up these events
          if p.user.id == params["user_id"].to_i
            all_matches_signed_up << m
          end
        end
      end
    end
    return all_matches_signed_up
  end
end
