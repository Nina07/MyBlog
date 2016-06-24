class RemoveColumnFromBlog < ActiveRecord::Migration
  def change
    remove_column :blogs, :hidden
  end
end
