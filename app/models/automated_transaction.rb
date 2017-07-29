class AutomatedTransaction < ActiveRecord::Base
	belongs_to :account
	belongs_to :airport
end
