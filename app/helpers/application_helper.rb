module ApplicationHelper
  def authorized_role?
    current_user.blog_owner?(current_user) || !current_user.is_normal_user?
    # Either a blog owner or NOT a normal user (can be a Moderator or Admin)
  end

end
