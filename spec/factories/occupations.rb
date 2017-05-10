FactoryGirl.define do

  factory :occupation do

    sequence(:name) { |i| "Occupation ##{i}" }
    sequence(:shorthand) { |i| "Shorthand ##{i}" }
    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      name ''
      shorthand ''
    end

  end

end
