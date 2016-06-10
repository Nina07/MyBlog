class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  validates :data, :blog_id,  presence: true
end
