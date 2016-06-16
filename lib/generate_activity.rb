module GenerateActivity
  def self.define_activity(*activities)
    activities.each do |activity|
      define_method("create_activity_for_#{activity}") do |act|
        Activity.create(approved: 0, user_id: user_id, activity_type_id: act_type_id, post_id: post_id)
      end
    end
  end
end
