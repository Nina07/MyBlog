class UserRole < ActiveRecord::Base
   ROLE_HASH = {
      1 => :admin,
      2 => :moderator,
      3 => :normal_user
   }
end
