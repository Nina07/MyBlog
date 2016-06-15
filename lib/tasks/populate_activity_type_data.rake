namespace :populate_activity_type_data do
  desc "Adds type of activities to the table"
  task populate_activity_types: :environment do
    [
      [activity_type: "blogs.update"],
      [activity_type: "blogs.destroy"],
      [activity_type: "comments.update"],
      [activity_type: "comments.destroy"]
    ].each do |act|
    puts "populating activity_types with #{act}"
      ActivityType.create(act)
    end
  end
end
