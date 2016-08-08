class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      redirect_to root_path, notice: 'logged in'
    else
      render :new
    end

  end

  def destroy
    sign_out
    redirect_back fallback_location: root_path, notice: 'logged out'
  end

end
