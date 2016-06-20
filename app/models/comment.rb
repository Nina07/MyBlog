class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many   :activities, as: :user_activity
  validates  :data, :blog_id, presence: true

  def comment_owner?(current_user)
    user_id == current_user.id
  end

  def create_update_activity(current_user,changes)
    activity = activities.create(activity_name: self.class , user_activity_id:         id, user_activity_type: "update", user_id: current_user.id)
    TrackActivity.save_activity_updates(changes,activity.id)
  end

  def create_destroy_activity(user)
    activity = activities.create(activity_name: self.class , user_activity_id:         id, user_activity_type: "destroy", user_id: user.id)
    TrackActivity.save_activity_updates(changes,activity.id)
  end
end
