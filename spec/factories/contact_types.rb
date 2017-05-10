FactoryGirl.define do

  factory :contact_type do

    sequence(:name) { |i| "ContactType ##{i}" }

    trait :invalid do
      name ''
    end

  end

end
