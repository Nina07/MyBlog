class TrackActivity < ActiveRecord::Base
  belongs_to :activity, dependent: :destroy
  store :activity_content, accessors: [:body, :title, :category, :user_activity_type]
end
