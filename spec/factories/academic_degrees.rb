FactoryGirl.define do

  factory :academic_degree do

    sequence(:name) { |i| "Academic Degree ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
