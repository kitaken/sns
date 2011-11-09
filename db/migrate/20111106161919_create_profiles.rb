class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nick_name
      t.string :real_name
      t.text :introduction
      # TODO: Add columns later
      t.timestamps
    end
  end
end
