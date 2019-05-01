class ApplicationController < ActionController::Base
  def welcome
    render html: "App Store Coming Soon!"
  end

  protected

  def after_sign_in_path_for(resource)
    apps_path
  end

  def after_sign_out_path_for(resource)
    apps_path
  end

end
