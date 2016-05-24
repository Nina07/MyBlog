class Blog < ActiveRecord::Base
  belongs_to :user
  validates :title, :category, :body, presence: true
end
