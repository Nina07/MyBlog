class Activity < ActiveRecord::Base
  belongs_to :user_activity, polymorphic: true
  validates :activity_name, :user_activity_id, :user_activity_type, presence: true
end
