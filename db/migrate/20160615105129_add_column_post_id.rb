class AddColumnPostId < ActiveRecord::Migration
  def change
    add_column :activities, :post_id, :integer, null: false
  end
end
