class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :activities, as: :user_activity
  has_many :comments, dependent: :destroy

  validates :title, :category, :body, presence: true

  def create_update_activity(current_user)
    activity = activities.create(activity_name: "update", user_id: current_user.id)
    TrackActivity.create(activity_content: changes, activity_id: activity.id)
  end

  def hide(current_user)
    update(hidden: true)
    create_destroy_activity(current_user)
  end

  def create_destroy_activity(current_user)
    activity = activities.create(activity_name: "destroy", user_id: current_user.id)
    TrackActivity.create(activity_content: {user_activity_type: activity.user_activity_type}, activity_id: activity.id)
  end
end
