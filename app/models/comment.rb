class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many   :activities, as: :user_activity
  validates  :data, :blog_id, presence: true

  def hide(current_user)
    update(hidden: true)
    create_destroy_activity(current_user)
  end

  def create_update_activity(current_user)
    activity = activities.create(activity_name: "update", user_id: current_user.id)
    TrackActivity.create(activity_content: changes, activity_id: activity.id)
  end

  def create_destroy_activity(current_user)
    activity = activities.create(activity_name: "destroy", user_id: current_user.id)
    TrackActivity.create(activity_content: {user_activity_type: activity.user_activity_type}, activity_id: activity.id)
  end
end
