namespace :charge_task do
	
	desc "run automatic charges"
	
	task run_charges: :environment do 
		AutomatedTransaction.all.each do |automated_transaction|
			line_item_params = {
				:price => automated_transaction.subtotal,     #put a comma to sperate keys
				:units => 1 
				}	 
			newlineitem = LineItem.new(line_item_params)
			invoice_params = {
				:account_id => automated_transaction.account_id,
				:airport_id => automated_transaction.airport_id,
				:registration => automated_transaction.registration
			}
			newinvoice = Invoice.new(invoice_params)
			newinvoice.line_items.append(newlineitem)
			newinvoice.save!
		end
	end	
end