class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in, unless: :devise_controller? 
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include Accessible
    skip_before_action :check_user, only: :destroy


    # def after_sign_in_path_for(airports)
    #   invoices_path
    # end  
    
    # def after_sign_in_path_for(users)
    #   pages_my_accounts_path
    # end  

    protected

    def logged_in
      unless current_airport || current_user
        redirect_to root_path, notice: "You must sign in "
      end
    end

    def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address1, :address2, :city, :state, :zip, :phone])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address1, :address2, :city, :state, :zip, :phone])
    end


end
