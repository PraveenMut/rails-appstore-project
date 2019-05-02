class UserProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  private

  def user_profile_params
    params.permit(:first_name, :last_name, :street, :suburb, :postcode, :state, :country)
  end
end
