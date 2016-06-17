class RenameActivityTableColumnBack < ActiveRecord::Migration
  def change
    rename_column :activities, :activity_id, :user_activity_id
    rename_column :activities, :activity_type, :user_activity_type
  end
end
