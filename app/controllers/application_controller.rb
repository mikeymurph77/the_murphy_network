class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_verification

  def check_verification
    return if session[:verified] == true
    redirect_to root_path
  end
end
