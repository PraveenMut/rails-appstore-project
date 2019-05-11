class StoresController < ApplicationController
  before_action :check_if_user_authorized, only: :new

  def new
    redirect_to new_app_path if current_user.store.present?
    @store = Store.new
  end

  def create
    @user = current_user
    @store = Store.new(store_params)
    @store.user_id = @user.id
    if @store.save
      redirect_to new_app_path
    else
      render 'new'
    end
  end

  def show
    @store = Store.find(params[:id])
    @apps = @store.apps
  end

  private

  def store_params
    params.permit(:name, :genre)
  end

  def check_if_user_authorized
    if user_signed_in?
      unless current_user.user_profile.present?
        flash[:user_profile_required] = "Please complete the profile form before continuing to register a store"
        redirect_to new_user_user_profile_path
      end
    end
  end

end