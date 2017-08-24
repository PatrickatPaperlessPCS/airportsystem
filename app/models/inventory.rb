class Inventory < ActiveRecord::Base
	belongs_to :airport
	has_many :line_items
	# after_save :create_quickbooks_item, only: [:create]


	def deduct(line_item_units)
		self.units_on_hand = self.units_on_hand - line_item_units 
		# self.units_on_hand =- line_item_units <- means the same thing =- is shorthand
		self.save!
	end

	def testing
		puts = 'test'
	end 
	def create_quickbooks_item
		qbo_api = QboApi.new(access_token: self.airport.token, realm_id: self.airport.realm_id)
						
				  item = {
				  "Name": "Garden Supplies",
				  "IncomeAccountRef": {
				    "value": "159",
				    "name": "Sales of Product Income"
				  },
				  "ExpenseAccountRef": {
				    "value": "80",
				    "name": "Cost of Goods Sold"
				  },
				  "AssetAccountRef": {
				    "value": "9999991",
				    "name": "Inventory Asset"
				  },
				  "Type": "Inventory",
				  "TrackQtyOnHand": true,
				  "QtyOnHand": 10,
				  "InvStartDate": "2015-01-01"
				}

			  response = qbo_api.create(:item, payload: item)
			 self.save!
		end	
end
