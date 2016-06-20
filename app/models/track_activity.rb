class TrackActivity < ActiveRecord::Base
  belongs_to :activity
  # serialize :activity_content
  store :activity_content, accessors: [:body, :title, :category]

  def self.save_activity_updates(changes,id)
    TrackActivity.create(activity_column: changes.keys , activity_content: changes, activity_id: id)
  end
end
