FactoryGirl.define do  factory :user do
    
  end
 
  factory(:admin) do
    email Faker::Internet.email
    password 'password'
  end
end