class RemoveAndCreateColumnTextToLetters < ActiveRecord::Migration
  def up
    remove_column :letters,:text
    add_column :letters,:text,:text
  end

  def down
    remove_column :letters,:text
    add_column :letters,:text,:string
  end
end
