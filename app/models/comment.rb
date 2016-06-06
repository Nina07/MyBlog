class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  # before_create :set_user_id

  def set_user_id
    byebug
    user_id = current_user.id
  end
end
