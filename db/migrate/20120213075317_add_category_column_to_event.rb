class AddCategoryColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :category_id, :integer

  end
end
