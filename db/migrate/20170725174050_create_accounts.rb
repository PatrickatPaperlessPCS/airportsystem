class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    t.integer  "user_id"
    t.string   "registration"
    t.decimal  "balance"
    t.date     "last_payment_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    end
  end
end
