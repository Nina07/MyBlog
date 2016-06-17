module GenerateActivity
  def self.define_activity(*activities)
    byebug
    define_method("create_activity_for_#{activities[1].downcase}_#{activities[0]}") do |argument|
      Activity.create(name: argument[1], user_activity_id: argument[2].id, user_activity_type: argument[0], user_id: argument[3].id)
      #defined method's argument will be model name, element id, action type and user_id
    end
  end
  
end
