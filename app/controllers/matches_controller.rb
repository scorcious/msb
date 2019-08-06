class MatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = policy_scope(Match).order(created_at: :desc)
  end

  def show
    authorize @match
    @players_a = @match.team_a.map { |player| User.find(player) }
    @players_b = @match.team_b.map { |player| User.find(player) }
    @forums = @match.forums
  end

  def new
    authorize @match = Match.new
  end

  def create
    authorize @match = Match.new(match_params)
    @match.user = current_user
    if @match.save
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
      render :show
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
      :location,
      :description,
      :time,
      :level,
      :number_of_players,
      :photo,
      :team_a,
      :team_b
    )
  end

  def set_match
    @match = Match.find(params[:id])
  end
end

# class PaintingsController < ApplicationController
#   skip_before_action :authenticate_user!, only: [:index, :show]
#   before_action :set_painting, only: [:show, :edit, :update, :destroy]

#   def index
#     @paintings = policy_scope(Painting).order(created_at: :desc)
#     @search = params["search"]
#     if @search.present? && @search["title"] != ""
#         @title = @search["title"]
#         @paintings = Painting.where("title ILIKE ?", "%#{@title}%")
#     end
#   end

#   def show
#     authorize @painting
#   end

#   def new
#     authorize @painting = Painting.new
#   end

#   def create
#     authorize @painting = Painting.new(painting_params)
#     @painting.user = current_user
#     if @painting.save
#       redirect_to @painting
#     else
#       render :new
#     end
#   end

#   def edit
#     authorize @painting
#   end

#   def update
#     authorize @painting
#     if @painting.update(painting_params)
#       render :show
#     else
#       render :edit
#     end
#   end

#   def destroy
#     authorize @painting
#     if @painting.bookings.empty?
#       @painting.destroy
#       redirect_to paintings_path
#     else
#       render :show, notice: 'Your painting has bookings'
#     end
#   end

#   private

#   def painting_params
#     params.require(:painting).permit(:title, :description, :price, :category, :location)
#   end

#   def set_painting
#     @painting = Painting.find(params[:id])
#   end
# end