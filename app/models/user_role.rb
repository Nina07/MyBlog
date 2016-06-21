class UserRole < ActiveRecord::Base
   ROLE_HASH = {
      0 => :admin,
      1 => :moderator,
      2 => :normal_user
   }
end
