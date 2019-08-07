class ForumsController < ApplicationController

  def new
    @forum = Forum.new
    authorize @forum
    @match = Match.find(params[:match_id])
  end

  def create
    authorize @forum = Forum.new(forum_params)
    @match = Match.find(params[:match_id])
    @forum.user = current_user
    @forum.match = @match
    if @forum.save
      redirect_to @match
    else
      render :new
    end
  end

private

def forum_params
  params.require(:forum).permit(:content)
end

end
