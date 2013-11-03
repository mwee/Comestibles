# This will guess the User class
FactoryGirl.define do
  
  factory :bill do
    amount 11.0
    user_id 0
    cart_id 0
    status "unpaid"
  end

  factory :user do
    name "John"
    id 0
    email { "#{name.downcase}#{id}@example.com" }
    password { "#{name.downcase}@example.com" + "000" }
    password_confirmation { "#{name.downcase}@example.com" + "000" }
  end

  factory :group do
    name "Team Awesome!"
    owner_id 0
    id 0
  end

  factory :group_membership do
    user_id 0
    group_id 0
  end

  factory :group_cart do
    group_id 0
    cart_id 0
  end

  factory :cart, :class => 'Cart' do
    id 0
    purchased_at '2012-05-19 09:33:56'
    created_at '2012-05-19 09:33:56'
    updated_at '2012-05-19 09:33:56'
    status "testing"
    finalized false
    cart_name "test cart"
  end

end
