class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user.nil?
      flash.now[:errors] = ["Invalid credentials entered"]
    else
      login!(@user)
      # learn below redirect URL!!!
      redirect_to user_url(@user)
    end
  end

  def destroy
    logout!

    redirect_to new_session_url

  end
end
