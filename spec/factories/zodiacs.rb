FactoryGirl.define do

  factory :zodiac do

    sequence(:name) { |i| "Zodiac ##{i}" }

    trait :invalid do
      name ''
    end

  end

end
