class AppsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :check_if_user_has_profile
  before_action :check_if_user_authorized, only: :edit

  def index
    @apps = App.all
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    @app.store_id = current_user.store.id
    if @app.save
      redirect_to app_path(@app.id)
    else
      render 'new'
    end
  end

  def show
    @app = App.find(params[:id])
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])
    if @app.update(app_params)
      flash[:apps_edit_success] = "Application Entry sucessfully edited"
      redirect_to app_path(@app.id)
    else
      render 'new'
    end
end

  def delete
    @app = App.find(params[:id])
    @app.destroy
    redirect_to apps_path
  end

  private

  def app_params
    params.require(:app).permit(:name, :description, :price, :blurb, :icon, images: [])
  end

  def check_if_user_has_profile
    if user_signed_in?
      unless current_user.user_profile.present?
        redirect_to new_user_user_profile_path(current_user.id)
      end
    end
  end

  def check_if_user_authorized
    @app = App.find(params[:id])
    if user_signed_in?
      if current_user != @app.store.user
        flash[:error_not_auth] = "You are not authorized to access this resource"
        redirect_to apps_path
      end
    end
  end

  

end