class AddThumbnailColumns < ActiveRecord::Migration
  def self.up
    add_column :profiles, :thumbnail_file_name, :string
    add_column :profiles, :thumbnail_content_type, :string
    add_column :profiles, :thumbnail_file_size, :integer
    add_column :profiles, :thumbnail_file_updated_at, :datetime
  end

  def self.down
    remove_column :profiles, :thumbnail_file_name
    remove_column :profiles, :thumbnail_content_type
    remove_column :profiles, :thumbnail_file_size
    remove_column :profiles, :thumbnail_file_updated_at
  end
end
