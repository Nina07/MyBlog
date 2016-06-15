class Blog < ActiveRecord::Base
  belongs_to :user
  validates :title, :category, :body, presence: true
  has_many :comments, dependent: :destroy

  # before_save :check_user_role

  # def self.check_user_role    
  # end

  def blog_owner?(current_user)
    user_id == current_user.id
  end
end
