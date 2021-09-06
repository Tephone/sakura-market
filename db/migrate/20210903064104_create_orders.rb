class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :delivery_date, null: false
      t.integer :send_fee, null: false
      t.integer :cod_charge, null: false
      t.references :delivery_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
