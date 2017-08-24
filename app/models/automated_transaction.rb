class AutomatedTransaction < ActiveRecord::Base
	belongs_to :account
	belongs_to :airport

	validates_presence_of :registration

end
