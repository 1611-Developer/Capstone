class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # A helper method that returns the base title.
  helper_method :base_title
  def base_title
    "Created.Software"
  end
end
