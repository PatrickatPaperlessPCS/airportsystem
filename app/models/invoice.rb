class Invoice < ActiveRecord::Base
	before_save :compute_total_amount
	belongs_to :account, touch: true
	has_many :line_items, dependent: :destroy
	accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true


	validates_presence_of :line_items

# sum up the total for all it's nested line items
		# def calculate_total_amount
		#   total = line_items.map(&:total).reduce(:+)
		# end

		

		def compute_total_amount
			puts "this worked" 
			puts self.line_items.inspect
		   	sum = 0
			self.line_items.each { |l| sum = sum + l.calculated_total.to_i  }
			puts sum
			self.total = sum
		end 
end
