class ApplicationController < ActionController::Base
  def welcome
    render html: "App Store Coming Soon!"
  end
end
