class Blog < ActiveRecord::Base
  extend GenerateActivity
  MODELNAME = self.model_name.plural
  belongs_to :user
  validates :title, :category, :body, presence: true
  has_many :comments, dependent: :destroy

  GenerateActivity.define_activity MODELNAME, :update, :destroy

  def blog_owner?(current_user)
    user_id == current_user.id
  end
end
