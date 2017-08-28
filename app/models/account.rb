class Account < ActiveRecord::Base
require 'qbo_api'	
	belongs_to :user
	has_many :payments
	has_many :invoices, dependent: :destroy
	after_touch :persist_account_balance
	# after_create :create_quickbooks_customer
	# belongs_to :airport
	before_save :normalize_registration
	validates_format_of :registration, with: /\A[a-zA-Z0-9]*\z/
	validates_uniqueness_of :registration, only: [:create]

	scope :open, -> {where(account_closed: [nil, false])}
	before_create :add_token

	validates_presence_of :email

	before_save :find_associated_user


	attr_encrypted :account_num, key: "thisis8970809u09u09yu09u09u09u809u0y08hinknk"


	def normalize_registration
		self.registration = self.registration.strip.upcase.gsub(" ", "")
	end

	def calculated_balance
		invoices.sum(:total)
	end

	def persist_account_balance
		self.balance = calculated_balance
		self.save!
	end
	
	def find_associated_user
		sanitize_email = self.email
		user = User.find_by(email: sanitize_email)
		if user
			self.user = user
		end
	end



	private


		def add_token
		  begin
		    self.auth_token = SecureRandom.hex[0,10].upcase
		  end while self.class.exists?(auth_token: auth_token)
		end


	end


# {
#     "BillAddr": {
#         "Line1": "123 Main Street",
#         "City": "Mountain View",
#         "Country": "USA",
#         "CountrySubDivisionCode": "CA",
#         "PostalCode": "94042"
#     },
#     "Notes": "Here are other details.",
#     "Title": "Mr",
#     "GivenName": "James",
#     "MiddleName": "B",
#     "FamilyName": "King",
#     "Suffix": "Jr",
#     "FullyQualifiedName": "King Groceries",
#     "CompanyName": "King Groceries",
#     "DisplayName": "King's Groceries",
#     "PrimaryPhone": {
#         "FreeFormNumber": "(555) 555-5555"
#     },
#     "PrimaryEmailAddr": {
#         "Address": "jdrew@myemail.com"


	# def create_quickbooks_customer
	# 		qbo_api = QboApi.new(access_token: self.airport.token, realm_id: self.airport.realm_id)
	# 		account = self
	#  		customer = {
	# 			    "BillAddr": {
	# 			        "Line1": account.address1,
	# 			        "Line2": account.address2,
	# 			        "City": account.city,
	# 			        "Country": "USA",
	# 			        "CountrySubDivisionCode": account.city,
	# 			        "PostalCode": account.zip
	# 				    },
	# 				    # "Notes": "Here are other details.",
	# 				    "GivenName": account.owner_first_name,
	# 				    "FamilyName": account.owner_last_name,
	# 				    "CompanyName": account.company,
	# 				    "Notes": account.registration,
	# 				    "PrimaryPhone": {
	# 				        "FreeFormNumber": account.telephone
	# 				    },
	# 				    "PrimaryEmailAddr": {
	# 				        "Address": account.email
	# 					       }
	# 					   }
	# 			response = qbo_api.create(:customer, payload: customer)
	# 			self.quickbooks_customer_id = response['Id']
	# 			self.save!
	# 	end