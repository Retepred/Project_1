class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception| redirect_to root_path, alert: "You can't access this page" end

  protected
    def afet_sign_in_path_for(resource)
      game_path
    end
end
