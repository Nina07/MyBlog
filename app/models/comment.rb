class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  validates :data, :blog_id,  presence: true

  def comment_owner?(current_user)
    user_id == current_user.id
  end
end
