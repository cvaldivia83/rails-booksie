class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user
  include Pundit::Authorization

  # Devise configuration

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :photo, :bio, :address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :photo, :bio, :address])
  end

  def after_sign_in_path_for(user)
    welcome_path
  end

  def set_user
    # Need to set up the user to use the navbar with link to user profile
    @user = current_user
  end

  # Pundit configuration

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
