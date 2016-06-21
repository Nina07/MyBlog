class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_activity, polymorphic: true
  has_many   :track_activities
  validates  :activity_name, :user_activity_id, :user_activity_type, presence: true

  before_create :capitalize_values

  def capitalize_values
    activity_name.capitalize!
  end
end
