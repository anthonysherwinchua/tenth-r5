FactoryGirl.define do

  factory :blood_type do

    sequence(:name) {|i| "BloodType ##{i}" }

    trait :invalid do
      name ''
    end

  end

end
