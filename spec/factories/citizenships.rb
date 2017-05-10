FactoryGirl.define do

  factory :citizenship do

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
