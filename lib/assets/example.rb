customer = {
  "GivenName": "Tom"
}
response = qbo_api.create(:customer, payload: customer)
p response['Id']

account = Account.find(2)
customer = {
  "GivenName" => account.owner_first_name,
  "FamilyName" => account.owner_last_name,
  "Company" => account.company
  "Balance" => account.balance,
  "DisplayName" => account.registration
}
response = qbo_api.create(:customer, payload: customer)