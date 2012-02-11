class RenameColumnThumbnailsOfProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :thumbnail_file_name       , :avatar_file_name       
    rename_column :profiles, :thumbnail_content_type    , :avatar_content_type    
    rename_column :profiles, :thumbnail_file_size       , :avatar_file_size       
    rename_column :profiles, :thumbnail_file_updated_at , :avatar_file_updated_at 
  end
end
