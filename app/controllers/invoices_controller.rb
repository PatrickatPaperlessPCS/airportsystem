class InvoicesController < ApplicationController
  before_action :authenticate_airport!
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]



  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_airport.invoices
    # current_user.patients.order("created_at DESC")
    # TODO - remove for Airport level authenication.
    # if current_airport.type = 1
    # redirect_to automated_transactions_path, notice: 'You are not subscribed to this feature, contact sales to upgrade' 
    # end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.airport_id = current_airport.id
      # if @invoice.user_id.present?
      #   #handle if user_id linked
      # else 
      #   @invoice.user_id = User.find_by(params[:registration])
      # end
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }


      else
        puts @invoice.errors.full_messages
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:_destroy, :account_id, :user_id, :registration, :paid, :airport_id, :subtotal, :tax, :total, line_items_attributes: [:_destroy, :description, :long_description, :price, :units, :tax, :invoice_id, :total])
    end

    def account_already_exists?
    @account = Account.find_by(registration: invoice_params[:registration])
    end
end
