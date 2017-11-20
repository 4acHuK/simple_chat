class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_verify_cookie

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def set_verify_cookie
    #action cable needs a way outside of controller logic to lookup a user
    return unless current_user
    cookies.signed[:vvc] = current_user.persistence_token
  end

  helper_method :current_user_session, :current_user
end
