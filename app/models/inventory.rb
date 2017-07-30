class Inventory < ActiveRecord::Base
	belongs_to :airport
	has_many :line_items

	def deduct(line_item_units)
		self.units_on_hand = self.units_on_hand - line_item_units 
		# self.units_on_hand =- line_item_units <- means the same thing =- is shorthand
		self.save!
	end

end
