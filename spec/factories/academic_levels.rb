FactoryGirl.define do

  factory :academic_level do

    sequence(:name) { |i| "Academic Level ##{i}" }

    trait :invalid do
      name ''
    end

  end

end
