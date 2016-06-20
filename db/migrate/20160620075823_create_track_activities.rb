class CreateTrackActivities < ActiveRecord::Migration
  def change
    create_table :track_activities do |t|
      t.string :activity_column
      t.text :activity_content
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
