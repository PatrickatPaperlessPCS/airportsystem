class AddInventoryIdToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :inventory, index: true, foreign_key: true
  end
end
