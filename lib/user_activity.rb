module UserActivity
  def create_activity(user_id, act_type,post_id)
    act_type_id = ActivityType.find_by(act_type: act_type).id
    Activity.create(approved: 0, user_id: user_id, activity_type_id: act_type_id, post_id: post_id)
  end
end
