class Activity < ActiveRecord::Base
  belongs_to :user_activity, polymorphic: true
  has_many   :track_activities
  validates  :activity_name, :user_activity_id, :user_activity_type, presence: true
end
