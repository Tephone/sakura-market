class RemoveCartItemFromOrderProducts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :order_products, :cart_item, foreign_key: true
  end
end
