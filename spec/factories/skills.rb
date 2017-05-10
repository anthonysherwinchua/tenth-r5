FactoryGirl.define do

  factory :skill do

    sequence(:name) { |i| "Citizenship ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
