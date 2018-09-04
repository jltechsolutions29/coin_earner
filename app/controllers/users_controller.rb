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
      flash[:notice] ="captcha solved"
      redirect_to root_path
    else
      flash[:alert] ="failed to solve captcha."
      redirect_to root_path
    end

  end

end
