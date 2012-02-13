class Category < ActiveRecord::Base
  def Category.list_for_select
    @@list_for_select || Category.update_list
  end
  def Category.update_list
    @@list_for_select = Category.all.map{|e| [e.name,e.id]}
  end
  @@list_for_select = nil
  after_save    {Category.update_list}
  after_destroy {Category.update_list}
end
