class StoresController < ApplicationController
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
end