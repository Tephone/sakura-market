class AddColomnToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :consume_point, :integer, null: false, default: 0
  end
end
