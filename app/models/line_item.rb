class LineItem < ActiveRecord::Base
	belongs_to :invoice
	before_save :persist_calculations

	validates_presence_of :price, :units

	def calculated_total
		price * units
	end

	def calculated_tax
		if self.tax?
			price * 0.08 
		else
			0
		end
	end

	def persist_calculations
		self.total = calculated_total + calculated_tax
		self.tax_amount = calculated_tax
	end
end
