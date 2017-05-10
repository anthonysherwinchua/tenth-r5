FactoryGirl.define do

  factory :country do

    sequence(:name) { |i| "Country ##{i}" }
    sequence(:iso) { |i| "ISO ##{i}" }
    sequence(:printable_name) { |i| "Country ##{i}" }
    sequence(:iso3) { |i| "ISO3 ##{i}" }
    sequence(:numcode) { |i| i }
    enabled true

    trait :invalid do
      name ''
      iso ''
      printable_name ''
      iso3 ''
      numcode nil
    end

    trait :disabled do
      enabled false
    end

  end

end
