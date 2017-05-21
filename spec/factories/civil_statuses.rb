FactoryGirl.define do

  factory :civil_status do

    sequence(:name) { |i| "CivilStatus ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
    end

  end

end
