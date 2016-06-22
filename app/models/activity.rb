class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_activity, polymorphic: true
  has_many   :track_activities
  validates  :activity_name, :user_activity_id, :user_activity_type, presence: true

  before_create :capitalize_values

  scope :approved, -> { where(approved: true) }

  def self.user_activities
    user_ids = Activity.pluck('distinct user_id')
    approved_act = Hash.new { |hash, key| hash[key] = Array.new }
    unapproved_act = approved_act.clone
    user_ids.each do |id|
      User.find(id).activities.each do |activity|
        if activity.approved
          approved_act[id] << activity
        else
          unapproved_act[id] << activity
        end
      end
    end
  end

  def capitalize_values
    activity_name.capitalize!
  end
end
