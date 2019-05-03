class RegistrationsController < Devise::RegistrationsController

  private 

  def after_sign_up_path_for(resource)
    new_user_user_profile_path(current_user.id)
  end
end