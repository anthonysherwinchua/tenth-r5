FactoryGirl.define do

  factory :school do

    sequence(:name) { |i| "School ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
