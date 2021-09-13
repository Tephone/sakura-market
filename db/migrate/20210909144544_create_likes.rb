class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :diary, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true, index: false

      t.timestamps
    end
    add_index :likes, %i[user_id diary_id], unique: true
  end
end
