FactoryGirl.define do

  factory :religion do

    sequence(:name) { |i| "Religion ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
