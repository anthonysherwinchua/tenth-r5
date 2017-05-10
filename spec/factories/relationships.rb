FactoryGirl.define do

  factory :relationship do

    sequence(:name) { |i| "Relationship ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
