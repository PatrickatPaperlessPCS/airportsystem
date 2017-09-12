class AutomatedTransaction < ActiveRecord::Base
	belongs_to :account
	belongs_to :airport

	# validates_presence_of :registration
		
	before_save :find_associated_account

		def find_associated_account
				sanitize_registration = self.registration.strip.upcase.gsub(" ", "")
			account = Account.find_by(registration: sanitize_registration)
			if account
				self.account = account
			end
		end
end
