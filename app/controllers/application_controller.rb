class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user

  def current_user
    Current.session&.user
  end

  def require_login
    redirect_to login_path unless current_user
  end

  # A helper method that returns the base title.
  helper_method :base_title
  def base_title
    "Created.Software"
  end
end
