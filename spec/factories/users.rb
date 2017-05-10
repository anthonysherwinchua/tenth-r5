FactoryGirl.define do

  factory :user do
    sequence(:email) { |i| "admin+#{i}@10thstory.com" }
    password 'password123'
    password_confirmation 'password123'

    trait :admin do
      role :admin
    end

    trait :manager do
      role :manager
    end

    trait :cashier do
      role :cashier
    end

    trait :processing do
      role :processing
    end

    trait :invalid do
      email nil
      password 'password456'
      password_confirmation 'password789'
    end

    trait :as_params do
      email 'new-email@10thstory.com'
      password 'password456'
      password_confirmation 'password456'
    end

  end

end
