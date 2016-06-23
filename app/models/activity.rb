class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_activity, polymorphic: true
  has_many   :track_activities
  validates  :activity_name, :user_activity_id, :user_activity_type, presence: true

  before_create :capitalize_values

  scope :approved, -> { where(approved: true) }

  def self.user_activities
    user_ids = Activity.pluck('distinct user_id')
    User.where(id: user_ids).each_with_object({}) do |user, user_activities|
      user_activities[user.full_name] = { approved: [], unapproved: [] }
      user.activities.each do |activity|
        user_activities[user.full_name][activity.approved ? :approved : :unapproved] << activity
      end
    end
  end

  def capitalize_values
    activity_name.capitalize!
  end
end
