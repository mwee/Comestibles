# This will guess the User class
FactoryGirl.define do
  
  factory :user do
    name "John"
    email { "#{name.downcase}@example.com" }
    password { "#{name.downcase}@example.com" + "000" }
    password_confirmation { "#{name.downcase}@example.com" + "000" }
  end

  factory :group do
    name "Team Awesome!"
    owner_id 0
  end

  factory :group_membership do
    user_id 0
    group_id 0
  end

end
