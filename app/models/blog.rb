class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :activities, as: :user_activity
  has_many :comments, dependent: :destroy

  validates :title, :category, :body, presence: true

  def create_update_activity
    byebug
    changed
    activities.create(activity_name: self.class , user_activity_id: id, user_activity_type: "update", user_id: user.id)
  end

  def create_destroy_activity(user)
    activities.create(activity_name: self.class , user_activity_id: self.id, user_activity_type: "destroy", user_id: user.id)
  end

  def blog_owner?(current_user)
    user_id == current_user.id
  end
end
