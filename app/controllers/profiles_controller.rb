class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_profile, only: [:add_friend, :accept_friend, :decline_friend]

  def index
    search = false

    if params.key?(:search)
      search = params[:search]
      if search.key?(:query)
        search = params[:search][:query]
        search = search.nil? && search == "" ? false : true
      end
    end

    if search == true && params[:search][:query].empty? == false
      @profiles = Profile.search_by_user_details(params[:search][:query])
    else
      @profiles = policy_scope(Profile).order(created_at: :desc)
    end
  end

  def my_friends
     @profiles = current_user.friends
     authorize @profiles
  end

  def show
    @profile = User.find(params[:id])
    authorize @profile
    @categories = @profile.categories.select(:name).distinct
    if current_user
      @matches = Match.where("status = ? AND user_id = ?", "open", current_user.id).order(created_at: :desc)
    end
    @player = Player.new
    # @ranking = Category.ranking_position(@matches[0].tag_list[0], current_user)
  end

  def add_friend
    current_user.friend_request(@profile)
    redirect_to profiles_path
  end

  def accept_friend
    current_user.accept_request(@profile)
    redirect_to my_friends_path
  end

   def decline_friend
    current_user.decline_request(@profile)
    redirect_to my_friends_path
  end

  private

  def set_profile
    authorize @profile = Profile.find(params[:id])
  end

end
