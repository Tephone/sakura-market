class AddNameToSeller < ActiveRecord::Migration[6.1]
  def change
    add_column :sellers, :name, :string, null: false
  end
end
