class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_airport!, except: [:edit, :show, :update]
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.order("registration DESC").paginate(:page => params[:page], :per_page => 15)
    # @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @show_paid = params[:paid]
    @show_unpaid = params[:unpaid]
  end

  # GET /accounts/new
  def new
    @account = Account.new
    if @account.user_id.nil?
      flash[:notice] = "You have successfully logged out."
    end
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.airport_id = current_airport.id
    puts current_airport
    respond_to do |format|
      if @account.save
        Invitation.invitation_email(@account).deliver_now!
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #OAUTH STUFF
  def oauth_success
    raise request.env["omniauth.auth"].inspect
  end

  def oauth_failure
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:registration, :auth_token, :account_closed, :owner_first_name, :owner_last_name, :company, :email, :telephone, :address1, :address2, :city, :state, :zip)
    end
end
