namespace :capitalize_user_names do
  desc "Converts first letter of names to capital"
  task convert: :environment do
    puts "Rake started"
    User.all.each do |user|
      user.f_name = user.f_name.capitalize
      user.l_name = user.l_name.capitalize
      user.save
    end
    puts "#{User.select(:f_name).count} records updated"
  end
end
