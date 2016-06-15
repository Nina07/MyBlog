class Activity < ActiveRecord::Base
  belongs_to :activity_type
  belongs_to :user

  # after_update :perform_activity, if: :approved_changed?

  # def perform_activity
  #   activity_type.act_type
  # end
end
