class AdminPanelController < ApplicationController

def today
	@invoices = Invoice.where("DATE(created_at) = ?", Date.today)
end

end
