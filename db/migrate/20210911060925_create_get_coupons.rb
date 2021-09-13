class CreateGetCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :get_coupons do |t|
      t.references :user, null: false, foreign_key: true, index: false
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
    add_index :get_coupons, %i[user_id coupon_id], unique: true
  end
end
