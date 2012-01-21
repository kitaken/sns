class ChangeColumnNameSendidAndRecidOfLetters < ActiveRecord::Migration
  def change
    rename_column :letters, :sendid, :sender_id
    rename_column :letters, :recid,  :receiver_id
  end
end
