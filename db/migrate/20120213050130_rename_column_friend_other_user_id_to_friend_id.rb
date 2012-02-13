class RenameColumnFriendOtherUserIdToFriendId < ActiveRecord::Migration
  def change
    rename_column :friendships,:other_user_id,:friend_id
  end
end
