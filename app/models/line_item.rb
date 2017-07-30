class LineItem < ActiveRecord::Base
	belongs_to :invoice
	belongs_to :inventory
	before_save :persist_calculations

	validates_presence_of :price, :units

	def calculated_total
		price * units + calculated_tax
	end

	def calculated_tax
		self.price * self.tax_rate
	end

	def persist_calculations
		self.total = calculated_total
		self.tax_amount = calculated_tax
	end
end
