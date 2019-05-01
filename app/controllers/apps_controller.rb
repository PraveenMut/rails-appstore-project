class AppsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @apps = App.all
  end

  def new
    @app = App.new
  end

  def show
    @app = App.find(params[:id])
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])
    @app.update(app_params)
    redirect_to app_path(@app.id)
end

  def delete
    @app = app.find(params[:id])
    @app.destroy
    redirect_to apps_path
  end

  private

  def app_params
    params.permit(:name, :description, :price)
  end

end

