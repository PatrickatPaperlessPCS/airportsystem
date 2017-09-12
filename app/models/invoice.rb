class Invoice < ActiveRecord::Base
	before_save :compute_total_amount
	belongs_to :account, touch: true
	has_many :line_items, dependent: :destroy
	accepts_nested_attributes_for :line_items, reject_if: :all_blank, allow_destroy: true
	after_save :deduct_from_inventory
	belongs_to :airport
	validates_presence_of :line_items
	
	before_save :find_associated_account

	# after_save :create_quickbooks_invoice

# sum up the total for all it's nested line items
		# def calculate_total_amount
		#   total = line_items.map(&:total).reduce(:+)
		# end

		scope :unpaid, -> {where(paid: [nil, false])}
		scope :paid, -> {where(paid: true)}


		def find_associated_account
				sanitize_registration = self.registration.strip.upcase.gsub(" ", "")
			account = Account.find_by(registration: sanitize_registration)
			if account
				self.account = account
			end
		end

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

		def create_quickbooks_invoice
			if self.airport.token.present?
					qbo_api = QboApi.new(access_token: self.airport.token, realm_id: self.airport.realm_id)

					  invoice = {
						    "Line": [
						      {
						        "Amount": 100.00,
						        "DetailType": "SalesItemLineDetail",
						        "SalesItemLineDetail": {
						          "ItemRef": {
						            "name": self.line_items.first.description
						          }
						        }
						      }
						    ],
						    "CustomerRef": {
						      "value": self.account.quickbooks_customer_id
						    }
						  }
						  response = qbo_api.create(:invoice, payload: invoice)
			end 
		end 
end
