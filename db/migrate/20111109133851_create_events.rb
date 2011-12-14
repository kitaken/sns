#coding:UTF-8
class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :start
      t.timestamp :end
      t.string :title

      t.text :body

      #イベント管理者とかを設定できるようにする必要がある

      t.timestamps
    end
  end
end
