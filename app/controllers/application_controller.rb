class ApplicationController < ActionController::Base

  include ApplicationHelper

  before_action :load_schema
  before_action :set_mailer_host
  before_action  :set_current_user

  protect_from_forgery prepend: true
  # rescue_from ActionController::RoutingError, :with => :render_404

  # helper_method :current_account

  def check_email
    user = User.find_by_email(params[:user][:email])
    res = User.check_email(user, params[:type])
    render json: res
  end

  private
  # def render_404(exception = nil)
  #   if exception
  #       logger.info "Rendering 404: #{exception.message}"
  #   end
  #
  #   render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  # end

  def set_current_user
    gon.current_user = current_user
    gon.token = cookies[:token]
  end

  def set_mailer_host
    subdomain = current_account ? "#{current_account.subdomain}." : ""
    Rails.env.production? ? env = "tiluu.com" : env = "lvh.me:5000"
    ActionMailer::Base.default_url_options[:host] = "#{subdomain}#{env}"
  end

  def current_account
    @current_account ||= Account.find_by(subdomain: request.subdomain)
  end

  def load_schema
    Apartment::Tenant.switch!('public')
    return unless request.subdomain.present?
    if current_account
      Apartment::Tenant.switch!(current_account.subdomain)
    else
      redirect_to root_path(subdomain: false)
    end
  end

  def after_sign_in_path_for(resource)
    session[:petty_cash_active] = Treasury::PettyCash.find_by(active: true)
    super
  end

  def after_sign_out_path_for(resource_or_scope)
    reset_session
    super
  end
  
end
