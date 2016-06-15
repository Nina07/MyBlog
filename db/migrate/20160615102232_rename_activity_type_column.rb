class RenameActivityTypeColumn < ActiveRecord::Migration
  def change
    rename_column :activity_types, :activity_type, :act_type
  end
end
