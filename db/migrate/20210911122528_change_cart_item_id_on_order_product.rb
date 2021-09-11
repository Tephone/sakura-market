class ChangeCartItemIdOnOrderProduct < ActiveRecord::Migration[6.1]
  def change
    change_column_null :order_products, :cart_item_id, true
  end
end
