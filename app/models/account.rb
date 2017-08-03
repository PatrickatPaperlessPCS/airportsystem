class Account < ActiveRecord::Base
require 'qbo_api'	
	has_many :payments
	has_many :invoices, dependent: :destroy
	after_touch :persist_account_balance
	after_create :create_quickbooks_invoice

	def calculated_balance
		invoices.sum(:total)
	end

	def persist_account_balance
		self.balance = calculated_balance
		self.save
	end

	def create_quickbooks_invoice
		token_string = "eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..Am9n_IT37EmuptVU54NRlQ.MWixCcyFOo25NRaH8_NKjyzM2WtDpDdmR4Rav1K2JJmn9FXst7Fc-d0p4Y428CHMHmkhWOP5KoJJYJ-BUfT6fjeaxAupaClVF-5cDCRbiMGYGnrCrRXkTAB93vWGMBSdJIKb_G6rbu3ddJDJ702d0uDPJYmSbEEKt3MJllLq16TrC7vVhFouAUfjsVh0MU-FD0g2ZeVgN2wE5mt4aOaeQ6Z4qRGvxFnOgniJLALftWcfEFWRiSGFdkovB9ukMsOwOV6aiaKQALEmcYkSlG89YbCgSkZCGWe8sY1-JKnm9DlTZLGkSQ3ZAGWfKt2etJGg4FgtlLVWDipe3gthuoy4EOKZCEDQZm76n8dvRvJylhoyat_jdFxPX7TmPwUcE8382nN_NM_R1oZveNvk5cdywdm-U8LUxWqR0T5rX_SSR1qw3mUFDKow65h0x5Bmo0w8QXEJQ9NHCk-9HFr4NnvP70laJ-D7XByxavXrUFlKHSq-tgHwUJQMfXK1Lox3YvBJOVsgRioYOHA63-ICAYvWWnfv1nH45fGFfDa2wbwwlXxlTju_BA8xW_4Q3FzU3WVQpIv-5qVRjg2W-yC98duhnQvcXYEzcCszU7iXzqqcLSJsxP61mH4sZAJXMCDoB_1jp-ria48iL51zNM-0JXT2gq6riRE7bHFiRq-zb9g9Af3maiz_MURSBhlnftj1Ywch.AEaa2IEWNZkXMkZrgsGl1w"
		qbo_api = QboApi.new(access_token: token_string, realm_id: 123145871611354)
		account = self
 		customer = {
			    "BillAddr": {
			        "Line1": account.address1,
			        "Line2": account.address2,
			        "City": "Mountaina View",
			        "Country": "UaSA",
			        "CountrySubDivisionCode": "CaA",
			        "PostalCode": "940a42"
				    },
				    # "Notes": "Here are other details.",
				    "Title": "Mra",
				    "GivenName": account.owner_first_name,
				    "FamilyName": account.owner_last_name,
				    "Suffix": "Jar",
				    # "FullyQualifiedName": "King Grocerieas",
				    "CompanyName": account.company,
				    "DisplayName": account.registration,
				    "PrimaryPhone": {
				        "FreeFormNumber": account.telephone
				    },
				    "PrimaryEmailAddr": {
				        "Address": "jdrew@myemail.coam"
					       }
					   }
			response = qbo_api.create(:customer, payload: customer)
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