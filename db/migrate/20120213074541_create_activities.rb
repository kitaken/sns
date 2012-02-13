class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :model_id
      t.string :model_type
      t.string :title
      t.text :description
      t.string :action

      t.timestamps
    end
  end
end
