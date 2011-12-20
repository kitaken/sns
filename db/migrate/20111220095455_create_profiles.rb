class CreateProfiles < ActiveRecord::Migration
  def change
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
