class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :password_confirmation

  validates :f_name, :l_name, :email, :address, :phone, presence: true
  validates :phone, numericality: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password, message: "should match password."

  belongs_to :user_role
  has_many :blogs, dependent: :destroy
  has_many :comments, through: :blogs
  has_many :activities, dependent: :destroy

  default_scope { order(updated_at: :desc) }

  def full_name
    f_name.capitalize + ' ' + l_name.capitalize
  end

  UserRole::ROLE_HASH.values.each do |role_name|
    define_method("is_#{role_name}?") do
      UserRole::ROLE_HASH[user_role.title] == role_name
    end
  end
end
