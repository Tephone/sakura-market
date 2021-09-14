class AddColumnsToSellers < ActiveRecord::Migration[6.1]
  def change
    add_column :sellers, :send_fee_per_box, :integer, null: false, default: 600
    add_column :sellers, :capacity_of_box, :integer, null: false, default: 5
  end
end
