# This will guess the User class
FactoryGirl.define do
  
  factory :user do
    name "John"
    email { "#{name.downcase}@example.com" }
    password_digest { "#{name.downcase}@example.com" + "000" }
  end

end
