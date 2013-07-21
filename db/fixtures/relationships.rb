users = User.all
user = User.first
followed_users = users[2..50]
followers = users[3..40]
followed_users.each { |followed| user.follow!(followed) unless user.following?(followed)}
followers.each      { |follower| follower.follow!(user) unless follower.following?(user)}
