class User < ActiveRecord::Base
  validates :f_name, :l_name, :email, :address, :phone, presence: true
  validates :phone, numericality: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_many :blogs, dependent: :destroy

  attr_accessor :password_confirmation

  def authenticate(password)
    password == User.find(self.id).password
  end
end
