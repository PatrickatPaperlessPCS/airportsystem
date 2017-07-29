require 'test_helper'

class AutomatedTransactionsControllerTest < ActionController::TestCase
  setup do
    @automated_transaction = automated_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:automated_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create automated_transaction" do
    assert_difference('AutomatedTransaction.count') do
      post :create, automated_transaction: { account_id: @automated_transaction.account_id, description: @automated_transaction.description, long_description: @automated_transaction.long_description, paid: @automated_transaction.paid, status: @automated_transaction.status, subtotal: @automated_transaction.subtotal, tax: @automated_transaction.tax, taxable: @automated_transaction.taxable, total: @automated_transaction.total }
    end

    assert_redirected_to automated_transaction_path(assigns(:automated_transaction))
  end

  test "should show automated_transaction" do
    get :show, id: @automated_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @automated_transaction
    assert_response :success
  end

  test "should update automated_transaction" do
    patch :update, id: @automated_transaction, automated_transaction: { account_id: @automated_transaction.account_id, description: @automated_transaction.description, long_description: @automated_transaction.long_description, paid: @automated_transaction.paid, status: @automated_transaction.status, subtotal: @automated_transaction.subtotal, tax: @automated_transaction.tax, taxable: @automated_transaction.taxable, total: @automated_transaction.total }
    assert_redirected_to automated_transaction_path(assigns(:automated_transaction))
  end

  test "should destroy automated_transaction" do
    assert_difference('AutomatedTransaction.count', -1) do
      delete :destroy, id: @automated_transaction
    end

    assert_redirected_to automated_transactions_path
  end
end
