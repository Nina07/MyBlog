class RemoveColumnActivityColumn < ActiveRecord::Migration
  def change
    remove_column :track_activities, :activity_column
  end
end
