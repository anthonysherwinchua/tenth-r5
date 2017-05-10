FactoryGirl.define do

  factory :civil_status do

    sequence(:name) { |i| "CivilStatus ##{i}" }

    trait :invalid do
      name ''
    end

  end

end
