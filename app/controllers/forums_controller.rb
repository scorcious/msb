class ForumsController < ApplicationController

skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @forums = Forum.all
    render json: @forums #Just for testing
  end

  def new
    @forum = Forum.new
    # authorize @forum
    @match = Match.find(params[:match_id])
  end

  def create
    authorize @forum = Forum.new(forum_params)
    @match = Match.find(params[:match_id])
    @forum.user = current_user
    @forum.match = @match
    @forum.save
  end

private

def forum_params
  params.require(:forum).permit(:content)
end

end
