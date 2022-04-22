
class Users::SessionsController < Devise::SessionsController

  respond_to :json, :html
  before_action :authenticate_user!, except: :create
  
  layout 'empty'

  def create
    if request.format.html?
      super { 
        cookies[:token] = current_token || ''
      }
    else
      resource = User.find_for_database_authentication(email: params[:user][:email])
      return invalid_login_attempt unless resource

      if resource.valid_password?(params[:user][:password])
        sign_in(resource, store: false)
        
        render(status: 200, success: true, json: resource)
      else
        invalid_login_attempt
      end

    end    

  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: {
      success: false,
      message: "Error with your email or password"
    }, status: 401, status: :unauthorized
  end 
  

  def validate_token
    render json: {
      success: true
    }, status: 200
  end
  
  def current_token
    request.env['warden-jwt_auth.token']
  end

  private

  def respond_with(resource, _opts = {})
    if request.format.html?
      super
    else
      if resource.valid?
        render json: resource.as_json(only: [:id, :email])
      else
         head :unauthorized
      end    
    end  
  end

  def respond_to_on_destroy
    if request.format.html?
      super
    else
      head :ok
    end  
  end
end  