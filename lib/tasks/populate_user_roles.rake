namespace :populate_user_roles do
  desc 'Populate different User Roles'
  task populate_different_roles: :environment do
    user_roles = 
    [
      [role: 0, title: "ADMIN"],
      [role: 1, title: "MODERATOR"],
      [role: 2, title: "USER"]
    ].each do |role|
        UserRole.create(role)
      end
  end
end
