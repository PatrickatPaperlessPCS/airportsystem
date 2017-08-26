module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    flash.clear
    if current_airport
      # if you have rails_admin. You can redirect anywhere really
      # redirect_to(rails_admin.dashboard_path) && return
        redirect_to invoices_path && return
    elsif current_user
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      # redirect_to(accounts_path) && return
    end
  end
end