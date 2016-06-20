class ChangeColumnDatatypeForTrackActivity < ActiveRecord::Migration
  def change
    change_column :track_activities, :activity_content, :text
  end
end
