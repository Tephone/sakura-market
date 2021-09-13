class AddColumnsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :stock, :integer, null: false, default: 0
    add_reference :products, :seller, null: false, foreign_key: true
  end
end
