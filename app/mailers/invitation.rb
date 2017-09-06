class Invitation < ApplicationMailer

	def invitation_email(account)
		@account = account
	     mail(
	  :subject => 'Your Airport Account is active!' ,
	  :to  => @account.email ,
	  :track_opens => 'true'
	)
	end

	def new_invoice_email(invoice)
		@invoice = invoice
	     mail(
	  :subject => "You've recieved a new invoice" ,
	  :to  => @invoice.account.email ,
	  :track_opens => 'true'
	)
	end
end
