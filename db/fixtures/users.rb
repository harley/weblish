100.times do |n|
  User.seed(:id) do |s|
    s.id = n
    s.email = "email_#{n}@example.com"
  end
end
