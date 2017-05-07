FactoryGirl.define do

  factory :user do
    sequence(:email) { |i| "admin+#{i}@10thstory.com" }
    password 'password123'
  end

end
