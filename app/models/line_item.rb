class LineItem < ActiveRecord::Base
	belongs_to :invoice
	belongs_to :inventory
	before_save :persist_calculations
	validates_presence_of :price, :units
	belongs_to :airport

	def calculated_total
		price * units + calculated_tax
	end

	def calculated_tax
		if self.tax_rate.present?
			self.price * self.tax_rate
		else
			self.price
		end
	end

	def persist_calculations
		self.total = calculated_total
		self.tax_amount = calculated_tax
	end

	
end
