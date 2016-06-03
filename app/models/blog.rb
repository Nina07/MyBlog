class Blog < ActiveRecord::Base
  belongs_to :user
  validates :title, :category, :body, presence: true
  has_many :comments, dependent: :destroy

  before_create :remove_enclosing_tags

  def remove_enclosing_tags
    body.delete!("<p></p><center></center>")
  end
end
