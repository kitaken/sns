class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :url
      t.text :body

      t.timestamps
    end
  end
end
