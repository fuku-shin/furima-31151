class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?




  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :read_first_name, :read_last_name, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do | username, password|
      username == 'admin' && password == '2222'
    end
  end

end

