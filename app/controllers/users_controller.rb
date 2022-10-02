# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    begin
      @user.save!
      redirect_to @user
    rescue ActiveRecord::RecordInvalid
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    begin
      @user.update!(user_params)
      redirect_to @user
    rescue ActiveRecord::RecordInvalid
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :birth_date)
    end
end
