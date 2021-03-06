class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

    def login!(user)
      @current_user = user
      session[:session_token] = @current_user.session_token
    end

    def current_user # STUDY THIS METHOD!!!
      return nil if session[:session_token].nil?
      @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def logout! # unlike login, doesn't need to take in a parameter!!!
      current_user.reset_session_token!
      @current_user = nil
      session[:session_token] = nil
    end

    def logged_in?
      !current_user.nil?
    end

end
