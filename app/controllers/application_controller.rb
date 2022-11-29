class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order
  helper_method :check_login

  protected
 
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_order
      @order=Order.find_by(status: "pending")
      if @order.nil? || @order.user_id != current_user.id
        Order.new(user_id: current_user.id )
      else
        return @order
      end
  end 

  def check_login
    if  current_user.nil?
      redirect_to user_session_path
    else
      @user=current_user
    end
  end
  
  def render_not_found
    render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
end
