FactoryGirl.define do

  factory :applicant_family_member do

    association :applicant, factory: :applicant, strategy: :build
    association :relationship, factory: :relationship, strategy: :build

    sequence(:name) {|i| "Name ##{i}" }
    age 18
    occupation 'Occupation'
    salary 1_000

    trait :invalid do
      name nil
      age nil
      occupation ''
      salary nil
    end

    trait :as_params do

    end

  end

end
