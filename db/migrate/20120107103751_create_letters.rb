class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.integer :sendid
      t.integer :recid
      t.string :text
      t.datetime :day

      t.timestamps
    end
  end
end
