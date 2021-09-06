class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :image
      t.text :content,null:false, default: ''
      t.boolean :display, null: false, default: true

      t.timestamps
    end
  end
end
