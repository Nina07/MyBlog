class User < ActiveRecord::Base
  validates :f_name, :l_name, :email, :address, :phone, presence: true
  validates :phone, numericality: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_many :blogs, dependent: :destroy
  has_many :comments, through: :blogs

  def authenticate(password)
    password == User.find(self.id).password
  end
end
