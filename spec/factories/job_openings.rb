FactoryGirl.define do

  factory :job_opening do

    association :country, factory: :country, strategy: :build
    association :occupation, factory: :occupation, strategy: :build

    enabled true

    trait :disabled do
      enabled false
    end

    trait :invalid do
      country_id nil
      occupation_id nil
    end

  end

end
