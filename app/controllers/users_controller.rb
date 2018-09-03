class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def solve_captcha
    if verify_recaptcha()
      redirect_to users_path
      flash[:notice] ="captcha solved"
      #do whatever it's suppose to do
    else
      redirect_to users_path
      flash[:alert] ="failed to solve captcha."
      #alert the user / deny access
    end
  end

end
