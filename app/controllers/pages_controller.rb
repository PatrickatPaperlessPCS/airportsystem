class PagesController < ApplicationController
	skip_before_action :logged_in
	before_filter :authenticate_user!, except: [:index]

  def index
  	if airport_signed_in?
  		redirect_to invoices_path
  	end
  	if user_signed_in?
  		redirect_to pages_my_accounts_path
  	end
  end

  def my_accounts
  	@accounts = current_user.accounts.order("created_at DESC")
  end
end
