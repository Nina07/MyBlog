class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :activities, as: :user_activity
  has_many :comments, dependent: :destroy

  validates :title, :category, :body, presence: true

  # after_save :create_destroy_activity, if: proc { hidden_changed? && hidden }

  def create_update_activity(current_user)
    activity = activities.create(activity_name: "update", user_id: current_user.id)
    TrackActivity.create(activity_content: changes, activity_id: activity.id)
  end

  def hide
    update(hidden: false)
  end

  def create_destroy_activity(current_user)
    activity = activities.create(activity_name: "destroy", user_id: current_user.id)
    TrackActivity.create(activity_content: changes, activity_id: activity.id)
  end

  def blog_owner?(current_user)
    user_id == current_user.id
  end
end
