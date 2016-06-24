class AddColumnHiddenToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :hidden, :boolean, default: false
  end
end
