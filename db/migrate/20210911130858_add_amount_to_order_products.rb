class AddAmountToOrderProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :order_products, :amount, :integer, null: false
  end
end
