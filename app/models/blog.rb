class Blog < ActiveRecord::Base
  belongs_to :user
  validates :title, :category, :body, presence: true
  has_many :comments, dependent: :destroy
end
