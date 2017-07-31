class Invoice < ActiveRecord::Base
	before_save :compute_total_amount
	belongs_to :account, touch: true
	has_many :line_items, dependent: :destroy
	accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true
	after_save :deduct_from_inventory

	validates_presence_of :line_items

# sum up the total for all it's nested line items
		# def calculate_total_amount
		#   total = line_items.map(&:total).reduce(:+)
		# end

		scope :unpaid, -> {where(paid: [nil, false])}
		scope :paid, -> {where(paid: true)}


		def compute_total_amount
			puts self.line_items.inspect
		   	sum = 0
			self.line_items.each { |l| sum = sum + l.calculated_total }
			self.total = sum
		end 

		def deduct_from_inventory
				self.line_items.each do |line_item|
					if line_item.inventory.present?
					line_item.inventory.deduct(line_item.units)
					end
			end	
		end
end
