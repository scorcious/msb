class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :update_matches_status_to_past
  before_action :get_notif_value

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :photo, :bio, :city, :address, :gender])
  end

  def get_notif_value
    if current_user
      @challenges_counts = policy_scope(Player).where(user_id: current_user, status: 'pending').count
      @matches_counts = find_all_matches_user_signed_up.count
      @buddies_pending_counts = current_user.requested_friends.count
      @total_counts = @challenges_counts + @matches_counts + @buddies_pending_counts
    end
  end

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def update_matches_status_to_past
    matches = Match.where("date < ?", Date.today)
    if matches.count != 0
      matches.each do |m|
        m.status = "past"
        m.save!
      end
    end
  end

  def find_all_matches_user_signed_up
    all_matches_signed_up = []
    Match.all.each do |m|
      if m.status != "past" && m.status != "cancelled"
        m.players.each do |p|
          # finding --> current user is signed up these events
          if p.user.id == current_user.id
            all_matches_signed_up << m
          end
        end
      end
    end
    return all_matches_signed_up
  end
end
