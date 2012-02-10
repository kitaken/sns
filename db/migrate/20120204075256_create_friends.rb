class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :other_user_id
      t.string :status

      t.timestamps
    end
  end
end
