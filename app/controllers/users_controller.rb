class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.first
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def solve_captcha
    if verify_recaptcha()
      redirect_to root_path
      flash[:notice] ="captcha solved"
      #do whatever it's suppose to do
    else
      redirect_to root_path
      flash[:alert] ="failed to solve captcha."
      #alert the user / deny access
    end
      #flash[:notice] ="captcha solved"
      #redirect_to users_path
  end

end
