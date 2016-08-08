class UsersController < ApplicationController


  before_action :find_user, only: [:show, :edit, :update]
  before_filter :require_correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @message = current_user.messages.build if signed_in?
    @messages = Message.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: 'user created'
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    if @user.save
      redirect_to @user, notice: 'stuff changed'
    else
      render :edit
    end
  end

private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :available)
  end

end
