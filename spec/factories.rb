FactoryGirl.define do
  
  factory(:admin) do
    user false
    email Faker::Internet.email
    password 'password'
  end

  factory :user, :class => Admin do
    user true
    email Faker::Internet.email
    password 'password'
  end


end
