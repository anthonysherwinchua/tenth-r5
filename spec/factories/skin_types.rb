FactoryGirl.define do

  factory :skin_type do

    sequence(:name) { |i| "SkinType ##{i}" }

    trait :invalid do
      name ''
    end

  end

end
