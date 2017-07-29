class AddTotalToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :total, :decimal
  end
end
