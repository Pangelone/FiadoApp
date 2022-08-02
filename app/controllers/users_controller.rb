class UsersController < ApplicationController 
  before_action :set_user, only: [:show, :update, :destroy] 

  def index 
    @users = User.all 
    render json: @users 
  end

  def create 
    @user = User.new(user_params) 
    if @user.save 
      render json: { success: true, user_id: @user.id } 
    else 
      render json: { success: false } 
    end 
  end 

  def update 
    if @user.update(user_params) 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  def show 
    render json: @user 
  end 

  def destroy 
    if @user.destroy 
      render json: { success: true } 
    else 
      render json: { success: false } 
    end 
  end 

  private

  def set_user
    @user = User.find(params[:id]) 
  end 
  def user_params 
    params.permit(:name) 
  end 
end