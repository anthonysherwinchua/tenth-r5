FactoryGirl.define do

  factory :applicant_requirement do

    association :applicant, factory: :applicant, strategy: :build
    association :document, factory: :document, strategy: :build

    note 'test'

    trait :invalid do
      document nil
    end

    trait :as_params do

    end

  end

end
