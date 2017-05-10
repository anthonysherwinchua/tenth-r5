FactoryGirl.define do

  factory :language do

    sequence(:name) { |i| "Language ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
