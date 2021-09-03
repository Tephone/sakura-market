class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :price, null: false
      t.references :order, null: false, foreign_key: true
      t.references :cart_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
