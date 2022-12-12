class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order
  helper_method :authetication
  helper_method :check_login
  helper_method :check_category
  protected
 
  def configure_permitted_parameters
    # byebug
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def current_order
    @order=Order.find_by(status: "pending",user_id:current_user.id)
    if @order.nil? 
      Order.new(user_id: current_user.id )
    else
      return @order
    end
  end 

  def authentication
    return @user=current_user if user_signed_in?
  end
   
  def check_login
    return redirect_to user_session_path if authentication.nil? 
  end
  
  def render_not_found
    render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def check_category (x, array)
    false
    return true if array.include? x  
  end

  
end
