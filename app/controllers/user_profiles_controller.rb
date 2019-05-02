class UserProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @check_user_profile = UserProfile.find(params[:id])
    if @check_user_profile == current_user
      redirect_to edit_user_user_profile_path
    end
    @user_profile = UserProfile.new
  end

  def create
    @user = current_user
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.user_id = @user.id
    if @user_profile.save
      redirect_to apps_path
    else
      render 'new'
    end
  end

  def show
    @user_profile = UserProfile.find(params[:id])
  end

  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  private

  def user_profile_params
    params.permit(:first_name, :last_name, :street, :suburb, :postcode, :state, :country)
  end
end
