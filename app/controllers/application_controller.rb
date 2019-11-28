class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :check_user_signed_in

  protected

  def check_user_signed_in
    if !user_signed_in?
      # raise "Hell"
      if request.path != "/users/sign_in" && request.path != "/users/sign_up" && request.path != '/about'
        redirect_to new_user_registration_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :number])
  end
end
