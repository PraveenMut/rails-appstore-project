class UserProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_profile = UserProfile.new
  end

  def create
    @user = User.find(params[:user_id])
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
    @user_profile.update(user_profile_params)
    redirect_to apps_path
  end

  private

  def user_profile_params
    params.permit(:first_name, :last_name, :street, :suburb, :postcode, :state, :country)
  end
end
