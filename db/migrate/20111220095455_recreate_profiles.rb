class RecreateProfiles < ActiveRecord::Migration
  def change
    drop_table :profiles
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nick_name
      t.string :real_name
      t.string :affiliation
      t.string :gender
      t.text :introduction
      t.string :pic

      t.timestamps
    end
  end
end
