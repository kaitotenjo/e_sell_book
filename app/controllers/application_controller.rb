class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order
  helper_method :authetication
  helper_method :check_category
  helper_method :is_admin?
  protected
 
  def configure_permitted_parameters
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
    @user=current_user if user_signed_in?
    return redirect_to user_session_path if @user.nil?
  end

  def is_admin?
    return redirect_to root_path if @user.role == "user"
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
