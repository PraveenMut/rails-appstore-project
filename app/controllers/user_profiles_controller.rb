class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def user_profile_params
    params.permit(:first_name, :last_name, :street, :suburb, :postcode, :state, :country)
  end
end
