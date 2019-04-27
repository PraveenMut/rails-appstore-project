class ApplicationController < ActionController::Base
  def hello
    render html: "App Store Coming Soon!"
  end
end
