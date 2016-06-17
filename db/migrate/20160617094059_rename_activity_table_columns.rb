class RenameActivityTableColumns < ActiveRecord::Migration
  def change
    rename_column :activities, :user_activity_id, :activity_id
    rename_column :activities, :user_activity_type, :activity_type
  end
end
