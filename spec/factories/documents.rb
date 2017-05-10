FactoryGirl.define do

  factory :document do

    sequence(:name) { |i| "Document ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
