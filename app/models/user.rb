class User < ActiveRecord::Base
  attr_accessor :password_confirmation

  validates :f_name, :l_name, :email, :address, :phone, presence: true
  validates :phone, numericality: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password, message: "should match password."

  has_many :blogs, dependent: :destroy
  has_many :comments, through: :blogs
  has_many :activities, dependent: :destroy

  def full_name
    f_name.capitalize + ' ' + l_name.capitalize
  end
end
