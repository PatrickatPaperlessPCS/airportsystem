class Account < ActiveRecord::Base
	has_many :payments
	has_many :invoices, dependent: :destroy
	after_touch :persist_account_balance

	def calculated_balance
		invoices.sum(:total)
	end

	def persist_account_balance
		self.balance = calculated_balance
	end

end
