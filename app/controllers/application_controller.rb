class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    
     protected

    # def logged_in
    #   unless current_user || current_owner
    #     redirect_to root_path, notice: "You must sign in "
    #   end
    # end

    # def configure_permitted_parameters
	   #  devise_parameter_sanitizer.permit(:sign_up, keys: [:registration, :name, :address, :city, :state, :zip, :balance, :last_payment, :token, :registration])
	   #  devise_parameter_sanitizer.permit(:account_update, keys: [:registration, :name, :address, :city, :state, :zip, :balance, :last_payment, :token, :registration])
    # end
end
