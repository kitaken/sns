class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :title
      t.string :url
      t.text :body

      t.timestamps
    end
  end
end
