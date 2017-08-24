require 'oauth2'
require 'qbo_api'
class QuickbooksAuthorizationsController < ApplicationController

# after_action :create_quickbooks_accounts, only: [:create]



def new
  @grant_url = oauth_client.auth_code.authorize_url(:redirect_uri => ENV['OAUTH_REDIRECT_URI'],
    :response_type => "code", :state => SecureRandom.hex(12), :scope => "com.intuit.quickbooks.accounting")
  @grant_url = URI.decode(@grant_url).html_safe
end

def create
  @data = {}
  if params[:state]
    if resp = oauth_client.auth_code.get_token(params[:code], :redirect_uri => ENV['OAUTH_REDIRECT_URI'])
      @data[:token] = resp.token
      @data[:realmId] = params[:realmId]
    end
  end
  	current_airport.token = @data[:token]
  	current_airport.realm_id = @data[:realmId]
    current_airport.connected_to_qb = true
  	current_airport.save!
  if current_airport.save
    redirect_to quickbooks_authorizations_select_accounts_path
  end
end



def oauth_params
	{
	  :site => "https://appcenter.intuit.com/connect/oauth2",
	  :authorize_url => "https://appcenter.intuit.com/connect/oauth2",
	  :token_url => "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"
		}
end


def oauth_client
	client_id = ENV['OAUTH_CLIENT_ID']
	client_secret = ENV['OAUTH_CLIENT_SECRET']
	OAuth2::Client.new(client_id, client_secret, oauth_params)
end

def create_quickbooks_accounts
  # qbo_api = QboApi.new(access_token: current_airport.token, realm_id: current_airport.realm_id)
  #         account ={
  #               "Name": "Automated Hangar Rent Transactions",
  #               "SubAccount": false,
  #               "Active": true,
  #               "Classification": "Revenue",
  #               "AccountType": "Income",
  #               "AccountSubType": "OtherPrimaryIncome",
  #               "domain": "QBO",
  #               "sparse": false,
  #               "Id": "9999991",
  #               "SyncToken": "0",
  #               "MetaData":
  #               {
  #                   "CreateTime": "2014-12-31T09:29:05-08:00",
  #                   "LastUpdatedTime": "2014-12-31T09:29:05-08:00"
  #               }
  #           }
  #       response = qbo_api.create(:account, payload: account)

end

end

# {"state"=>"585f8ee97ffcea69fec4630a", "code"=>"L011501806668bC1FiqoZa7oGaOwDfiMCtKmodD1uSn2OUG8Qc", 
# "realmId"=>"123145871611354", "controller"=>"quickbooks_authorizations", "action"=>"create"}


# <?xml version="1.0" encoding="UTF-8" standalone="yes"?><IntuitResponse xmlns="http://schema.intuit.com/finance/v3" 
# time="2017-08-03T17:27:53.885-07:00"><Fault type="ValidationFault"><Error code="610" element=""><Message>Object Not Found</Message><Detail>Object Not Found : Something you're trying to 
# use has been made inactive. Check the fields with accounts, customers, items, vendors or employees.</Detail></Error></Fault></IntuitResponse>