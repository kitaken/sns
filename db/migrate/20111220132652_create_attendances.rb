class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :rsvp

      t.timestamps
    end
  end
end
