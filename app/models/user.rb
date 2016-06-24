class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :f_name, :l_name, :email, :address, :phone, presence: true
  validates :phone, numericality: true
  validates :email, uniqueness: true

  belongs_to :user_role
  has_many :blogs, dependent: :destroy
  has_many :comments, through: :blogs
  has_many :activities, dependent: :destroy

  default_scope { order(updated_at: :desc) }

  before_create { self.f_name.capitalize! ; self.l_name.capitalize! }

  def full_name
    f_name.capitalize + ' ' + l_name.capitalize
  end

  def blog_owner?(current_user)
    id == current_user.id
  end

  def comment_owner?(current_user)
    id == current_user.id
  end

  UserRole::ROLE_HASH.values.each do |role_name|
    define_method("is_#{role_name}?") do
      UserRole::ROLE_HASH[user_role.role] == role_name #this type of usage helps in saving database interactions, as we have declared a hash in UserRole model , it checks values directly from there.
    end
  end
end
