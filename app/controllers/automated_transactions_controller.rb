class AutomatedTransactionsController < ApplicationController
  before_action :set_automated_transaction, only: [:show, :edit, :update, :destroy]

  # GET /automated_transactions
  # GET /automated_transactions.json
  def index
    @automated_transactions = AutomatedTransaction.all
  end

  # GET /automated_transactions/1
  # GET /automated_transactions/1.json
  def show
  end

  # GET /automated_transactions/new
  def new
    @automated_transaction = AutomatedTransaction.new
  end

  # GET /automated_transactions/1/edit
  def edit
  end

  # POST /automated_transactions
  # POST /automated_transactions.json
  def create
    @automated_transaction = AutomatedTransaction.new(automated_transaction_params)

    respond_to do |format|
      if @automated_transaction.save
        format.html { redirect_to @automated_transaction, notice: 'Automated transaction was successfully created.' }
        format.json { render :show, status: :created, location: @automated_transaction }
      else
        format.html { render :new }
        format.json { render json: @automated_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /automated_transactions/1
  # PATCH/PUT /automated_transactions/1.json
  def update
    respond_to do |format|
      if @automated_transaction.update(automated_transaction_params)
        format.html { redirect_to @automated_transaction, notice: 'Automated transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @automated_transaction }
      else
        format.html { render :edit }
        format.json { render json: @automated_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /automated_transactions/1
  # DELETE /automated_transactions/1.json
  def destroy
    @automated_transaction.destroy
    respond_to do |format|
      format.html { redirect_to automated_transactions_url, notice: 'Automated transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_automated_transaction
      @automated_transaction = AutomatedTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def automated_transaction_params
      params.require(:automated_transaction).permit(:account_id, :description, :long_description, :subtotal, :taxable, :tax, :total, :paid, :status)
    end
end
