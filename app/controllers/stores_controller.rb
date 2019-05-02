class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
    @user = User.find(params[:user_id])
    @store = Store.new(store_params)
    @store.user_id = @user.id
    if @store.save?
      redirect_to apps_path
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