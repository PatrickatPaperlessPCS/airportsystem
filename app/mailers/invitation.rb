class Invitation < ApplicationMailer

	def invitation_email(account)
		@account = account
	     mail(
	  :subject => 'Your Airport Account is active!' ,
	  :to  => @account.email ,
	  :track_opens => 'true'
	)
	end
end
